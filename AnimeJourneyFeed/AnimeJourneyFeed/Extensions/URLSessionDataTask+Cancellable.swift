//
//  URLSessionDataTask.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /142/23.
//

import Foundation

protocol Cancellable {
    func cancel()
}

extension URLSessionDataTask: Cancellable {
    
}
