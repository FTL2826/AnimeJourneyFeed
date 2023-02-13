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
    func parseJsonData(data: Data) -> ApiAnswer?
    
    var parsedAnswer: ApiAnswer? { get }
}

class DataManager: DataManagerProtocol {
    
    var parsedAnswer: ApiAnswer? {
        get {
            return parseJsonData(data: getJsonData()!)
        }
    }
    
    func obtainTitles() -> [Title] {
        return [Title(name: "SE3", rating: 78), Title(name: "TWD", rating: 66), Title(name: "LaLaLend", rating: 93)]
    }
    
    func getJsonData() -> Data? {
    
        if let path = Bundle.main.path(forResource: "anime", ofType: "json") {
            if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                return jsonData
            }
        }
        return nil
    }
    
    func parseJsonData(data: Data) -> ApiAnswer? {
        var answer: ApiAnswer? = nil
        let decoder = JSONDecoder()
        do {
            answer = try decoder.decode(ApiAnswer.self, from: data)
        } catch {
            print("DEBUG PRINT:", error)
        }
        return answer
    }
    
}
