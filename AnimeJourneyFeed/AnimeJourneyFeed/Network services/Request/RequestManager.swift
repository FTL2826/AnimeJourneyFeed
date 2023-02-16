//
//  RequestManager.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /162/23.
//

import Foundation

protocol RequestManagerProtocol {
    
//    func perform<T: Decodable>() async throws -> T
}


class RequestManager: RequestManagerProtocol {
    
    let feedLoader: FeedLoaderProtocol
    let parser: DataParserProtocol
    
    init(feedLoader: FeedLoaderProtocol, parser: DataParserProtocol) {
        self.feedLoader = feedLoader
        self.parser = parser
    }
    
//    func perform<T: Decodable>() async throws -> T {
//
//    }
    
}
