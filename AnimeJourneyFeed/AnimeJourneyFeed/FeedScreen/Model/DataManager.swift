//
//  DataManager.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /102/23.
//

import Foundation

protocol DataManager: AnyObject {
    func obtainTitles() -> [Title]
}

class DataManagerImplementation: DataManager {
    
    func obtainTitles() -> [Title] {
        return [Title(name: "SE3", rating: 78), Title(name: "TWD", rating: 66), Title(name: "LaLaLend", rating: 93)]
    }
    
}
