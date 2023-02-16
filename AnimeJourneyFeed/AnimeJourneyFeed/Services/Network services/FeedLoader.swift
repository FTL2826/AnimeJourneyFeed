//
//  FeedLoader.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /152/23.
//

import Foundation

protocol FeedLoaderProtocol {
    func fetchFeedData(for urlString: String, completionHandler: @escaping (Result<ApiResponse, Error>) -> ())
    
}

class FeedLoader: FeedLoaderProtocol {
    
    func fetchFeedData(for link: String, completionHandler: @escaping (Result<ApiResponse, Error>) -> ()) {
        
        guard let url = URL(string: link) else {
            completionHandler(.failure(NetworkError.invalidURL))
            return }
        var request = URLRequest(url: url)
        request.addValue("application/vnd.api+json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/vnd.api+json", forHTTPHeaderField: "Accept")

        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            
            guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completionHandler(.failure(NetworkError.invalidServerResponse))
                return
            }
            let apiResponse = try? JSONDecoder().decode(ApiResponse.self, from: data)
            if let apiResponse = apiResponse {
                completionHandler(.success(apiResponse))
            } else {
                completionHandler(.failure(NetworkError.invalidServerResponse))
            }
            
        }.resume()
        
        
    }
    
    
}
