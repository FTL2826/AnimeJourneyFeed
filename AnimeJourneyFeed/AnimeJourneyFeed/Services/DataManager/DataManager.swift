//
//  DataManager.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /102/23.
//

import Foundation

protocol DataManagerProtocol: AnyObject {
    func obtainTitles() -> [Title]
    func getJsonData() -> Data?
    func parseJsonData(data: Data) -> ApiResponse?
    
    var parsedAnswer: ApiResponse? { get }
}

class DataManager: DataManagerProtocol {
    
    var parsedAnswer: ApiResponse? {
        get {
            return parseJsonData(data: getJsonData()!)
        }
    }
    
    func obtainTitles() -> [Title] {
        return [Title(name: "SE3", rating: 78), Title(name: "TWD", rating: 66), Title(name: "LaLaLend", rating: 93)]
    }
    
    func getJsonData() -> Data? {
    
        if let path = Bundle.main.path(forResource: "anime20", ofType: "json") {
            if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                return jsonData
            }
        }
        return nil
    }
    
    func parseJsonData(data: Data) -> ApiResponse? {
        var answer: ApiResponse? = nil
        let decoder = JSONDecoder()
        do {
            answer = try decoder.decode(ApiResponse.self, from: data)
        } catch {
            print("DEBUG PRINT:", error)
        }
        return answer
    }
    
}