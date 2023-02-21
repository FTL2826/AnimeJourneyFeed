//
//  DataManager.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /102/23.
//

import Foundation

protocol DataManagerProtocol: AnyObject {
    
    var apiAnswer: ApiResponse! { get set }
    var titlesData: [TitleData] { get }
}

class DataManager: DataManagerProtocol {
    
    var apiAnswer: ApiResponse! {
        didSet {
            titlesData += apiAnswer.data
        }
    }
    var titlesData: [TitleData] = []
    
    
}
