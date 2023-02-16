//
//  PosterLoader.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /142/23.
//

import Foundation

protocol PosterLoaderProtocol {
    func loadImageData(for url: URL, completion: @escaping (Data?) -> ()) -> Cancellable
}

class PosterLoader: PosterLoaderProtocol {
    
    func loadImageData(for url: URL, completion: @escaping (Data?) -> ()) -> Cancellable {
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            defer {
                DispatchQueue.main.async {
                    completion(data)
                }
            }
            guard error == nil else { return }
        }
        
        dataTask.resume()
        return dataTask
    }
    
    
}
