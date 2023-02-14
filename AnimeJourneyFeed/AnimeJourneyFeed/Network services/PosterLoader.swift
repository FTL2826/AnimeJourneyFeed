//
//  PosterLoader.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /142/23.
//

import UIKit.UIImage

protocol PosterLoaderProtocol {
    func loadImageData(for url: URL, completion: @escaping (Data?) -> ()) -> Cancellable
}

class PosterLoader: PosterLoaderProtocol {
    
    func loadImageData(for url: URL, completion: @escaping (Data?) -> ()) -> Cancellable {
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil else {
                completion(nil)
                return }
            if let data = data {
                completion(data)
            }
        }
        
        dataTask.resume()
        return dataTask
    }
    
    
}
