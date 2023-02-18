//
//  PersistentProviderProtocol.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /182/23.
//

import Foundation
import CoreData.NSManagedObjectContext

enum PersistentState {
    case update, add, remove
}

enum PersistentConstants {
    static let persistenceStorage = "PersistenceStorage"
//    static let infoModel = "InfoCDModel"
//    static let characterModel = "CharacterCDModel"
//    static let locationModel = "LocationCDModel"
//    static let episodeModel = "EpisodeCDModel"
//    static let characterFilterModel = "CharacterFilterCDModel"
    static let posterImage = "PosterImage"
}

protocol PersistentProviderProtocol {
//    var mainViewContext: NSManagedObjectContext! { get }
//    var backgroundViewContext: NSManagedObjectContext! { get }
//    //MARK: - PosterImage
//    func updatePoster(tiny: String, medium: String)

    
}
