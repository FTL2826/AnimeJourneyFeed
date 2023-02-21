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
    static let posterImage = "PosterImage"
}

protocol PersistentProviderProtocol {
    var mainViewContext: NSManagedObjectContext! { get }
    var backgroundViewContext: NSManagedObjectContext! { get }
    func saveContext()
    
    //MARK: - Links
    func updateLinks(linksData: Links)
    func fetchLinksModel() -> [LinksCDModel]
    func linksCDModelToStruct(model: [LinksCDModel]) -> Links
    
    //MARK: - Meta
    func updateMeta(metaInfo: MetaInfo)
    func fetchMetaModel() -> [MetaCDModel]
    func metaCDModelToStruct(model: [MetaCDModel]) -> MetaInfo
    
    //MARK: - TitlesData
    func updateTitlesData(models: [TitleData])
    func fetchTitlesDataModel() -> [TitleDataCDModel]
    func titlesDataCDModelToStruct(model: [TitleDataCDModel]) -> [TitleData]
}
