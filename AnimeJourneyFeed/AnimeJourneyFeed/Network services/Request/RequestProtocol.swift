//
//  RequestProtocol.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /162/23.
//

import Foundation

enum RequestType: String {
    case get = "GET"
    case post = "POST"
}

enum ApiConstants {
    static let host = "kitsu.io/api"
    // https://kitsu.io/api/edge/anime?page[limit]=20&page[offset]=0
}

protocol RequestProtocol {
    
    var path: String { get }
    
    var headers: [String: String] { get }
    var params: [String: Any] { get }
    
    var urlParams: [String: String?] { get }
    
    var addAuthorizationToken: Bool { get }
    
    var requestType: RequestType { get }
}

extension RequestProtocol {
    
    var host: String {
        ApiConstants.host
    }
    
    var addAuthorizationToken: Bool {
        false
    }
    
    var params: [String: Any] {
        [:]
    }
    
    var urlParams: [String: String] {
        [:]
    }
    
    var headers: [String: String] {
        [:]
    }
    
    func createURLRequest(authToken: String) throws -> URLRequest {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path
        
        if !urlParams.isEmpty {
            components.queryItems = urlParams.map {
                URLQueryItem(name: $0, value: $1)
                
            }
        }
        
        guard let url = components.url else { throw NetworkError.invalidURL }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue
        
        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }
        
        if addAuthorizationToken {
            urlRequest.setValue(authToken, forHTTPHeaderField: "Authorization")
        }
        
        urlRequest.setValue("application/vnd.api+json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/vnd.api+json", forHTTPHeaderField: "Accept")
        
        if !params.isEmpty {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
        }
        
        return urlRequest
    }
    
    
}
