//
//  PersistentProvider+Data.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /192/23.
//

import Foundation
import CoreData

extension PersistentProvider: PersistentProviderProtocol {
    
    
    //MARK: - Links
    func updateLinks(linksData: Links) {
        backgroundViewContext.performAndWait {
            //updating
            if let links = try? LinksCDModel.fetchRequest().execute().first {
                links.update(links: linksData)
            } else {
                let linksCD = LinksCDModel(context: backgroundViewContext)
                linksCD.configNew(links: linksData)
            }
            saveContext()
        }
    }
    
    func fetchLinksModel() -> [LinksCDModel] {
        let request = LinksCDModel.fetchRequest()
        request.returnsObjectsAsFaults = false
        let links = try? mainViewContext.fetch(request)
        guard let links = links else { return [LinksCDModel]() }
        return links
    }
    
    //MARK: - Meta
    func updateMeta(metaInfo: MetaInfo) {
        backgroundViewContext.performAndWait {
            //updating
            if let meta = try? MetaCDModel.fetchRequest().execute().first {
                meta.update(metaInfo: metaInfo)
            } else {
                let metaCD = MetaCDModel(context: backgroundViewContext)
                metaCD.configNew(metaInfo: metaInfo)
            }
            saveContext()
        }
    }
    
    func fetchMetaModel() -> [MetaCDModel] {
        let request = MetaCDModel.fetchRequest()
        request.returnsObjectsAsFaults = false
        let meta = try? mainViewContext.fetch(request)
        guard let meta = meta else { return [MetaCDModel]() }
        return meta
    }
    
    //MARK: - Titles Data
    func updateTitlesData(models: [TitleData]) {
        backgroundViewContext.performAndWait {
            models.forEach {
                if let titleData = try? self.fetchRequest(for: $0).execute().first {
                    titleData.update(titlesData: $0)
                } else {
                    let titleDataCD = TitleDataCDModel(context: backgroundViewContext)
                    titleDataCD.configNew(titlesData: $0)
                }
            }
            saveContext()
        }
    }
    
    func fetchTitlesDataModel() -> [TitleDataCDModel] {
        let request = TitleDataCDModel.fetchRequest()
        request.returnsObjectsAsFaults = false
        let titlesData = try? mainViewContext.fetch(request)
        guard let titlesData = titlesData else { return [TitleDataCDModel]() }
        return titlesData
    }
    
    
}

//MARK: - FetchRequest with id CD Model TitleData and extension TitleDataCDModel
private extension PersistentProvider {
    func fetchRequest(for titleData: TitleData) -> NSFetchRequest<TitleDataCDModel> {
        let request = TitleDataCDModel.fetchRequest()
        request.predicate = .init(format: "id == %i", titleData.id)
        return request
    }
}

fileprivate extension TitleDataCDModel {
    
    func update(titlesData: TitleData) {
        self.id = titlesData.id
        self.type = titlesData.type
        
        
//        self.attributes?.ageRatingGuide = titlesData.attributes.ageRatingGuide
//        self.attributes?.averageRating = titlesData.attributes.averageRating
//        self.attributes.canonicalTitle = titlesData.attributes.canonicalTitle
//        self.attributes.createdAt = titlesData.attributes.createdAt
//        self.attributes.endDate = titlesData.attributes.endDate
//        self.attributes.episodeCount = Int16(titlesData.attributes.episodeCount ?? 0)
//        self.attributes.episodeLength = Int16(titlesData.attributes.episodeLength ?? 0)
//        self.attributes.favoritesCount = Int16(titlesData.attributes.favoritesCount)
//        self.attributes.startDate = titlesData.attributes.startDate
//        self.attributes.status = titlesData.attributes.status
//        self.attributes.subtype = titlesData.attributes.subtype
//        self.attributes.synopsis = titlesData.attributes.synopsis
//        self.attributes.updatedAt = titlesData.attributes.updatedAt
        
//        self.attributes.coverImage?.tiny = titlesData.attributes.coverImage?.tiny
//        self.attributes.posterImage?.tiny = titlesData.attributes.posterImage.tiny
//        self.attributes.posterImage?.medium = titlesData.attributes.posterImage.medium
//        self.attributes.titles?.english = titlesData.attributes.titles.english
//        self.attributes.titles?.romaji = titlesData.attributes.titles.romaji
//        self.attributes.titles?.japanese = titlesData.attributes.titles.japanese
    }

    func configNew(titlesData: TitleData) {
        update(titlesData: titlesData)
    }
    
}

fileprivate extension TitleAttributesCDModel {
//    convenience init(attributes: TitleAttributes) {
//        ageRatingGuide = attributes.ageRatingGuide
//        averageRating = attributes.averageRating
//        canonicalTitle = attributes.canonicalTitle
//        createdAt = attributes.createdAt
//        endDate = attributes.endDate
//        episodeCount = Int16(attributes.episodeCount ?? 0)
//        episodeLength = Int16(attributes.episodeLength ?? 0)
//        favoritesCount = Int16(attributes.favoritesCount)
//        startDate = attributes.startDate
//        status = attributes.status
//        subtype = attributes.subtype
//        synopsis = attributes.synopsis
//        updatedAt = attributes.updatedAt
//    }
}


//MARK: - LinksCDModel
fileprivate extension LinksCDModel {
    
    func update(links: Links) {
        self.first = links.first
        self.next = links.next
        self.last = links.last
    }

    func configNew(links: Links) {
        update(links: links)
    }
    
}

//MARK: - MetaCDModel
fileprivate extension MetaCDModel {
    
    func update(metaInfo: MetaInfo) {
        self.metaInfo = Int16(metaInfo.count)
    }

    func configNew(metaInfo: MetaInfo) {
        update(metaInfo: metaInfo)
    }
    
}


