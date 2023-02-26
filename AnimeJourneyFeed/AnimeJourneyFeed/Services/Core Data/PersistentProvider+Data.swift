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
    
    func linksCDModelToStruct(model: [LinksCDModel]) -> Links {
        return Links(from: model.first!)
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
    
    func metaCDModelToStruct(model: [MetaCDModel]) -> MetaInfo {
        return MetaInfo(from: model.first!)
    }
    
    //MARK: - Titles Data
    func updateTitlesData(models: [TitleData]) {
        backgroundViewContext.performAndWait {
            var titlesModels = models
            titlesModels.forEach {
                if let titleData = try? self.fetchRequest(for: $0).execute().first {
                    titleData.update(titlesData: $0)
                } else {
                    let titleDataCD = TitleDataCDModel(context: backgroundViewContext)
                    titleDataCD.configNew(titlesData: $0)
                }
            }
            titlesModels.sort {Int($0.id) ?? 1 > Int($1.id) ?? 0}
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
    
    func titlesDataCDModelToStruct(model: [TitleDataCDModel]) -> [TitleData] {
        var data = [TitleData]()
        model.forEach {
            data.append(TitleData(from: $0))
        }
        return data
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
    
    var attributes: TitleAttributes {
        
        get {
            return TitleAttributes(
                createdAt: createdAt,
                updatedAt: updatedAt,
                synopsis: synopsis,
                titles: Titles(
                    english: englishTitle,
                    romaji: romajiTitle,
                    japanese: japaneseTitle),
                canonicalTitle: canonicalTitle,
                averageRating: averageRating,
                favoritesCount: Int(favoritesCount),
                startDate: startDate,
                endDate: endDate,
                ageRatingGuide: ageRatingGuide,
                subtype: subtype,
                status: status,
                posterImage: PosterImage(
                    tiny: posterImageTiny,
                    medium: posterImageMedium),
                coverImage: CoverImage(
                    tiny: coverImageTiny),
                episodeCount: Int(episodeCount),
                episodeLength: Int(episodeLength)
            )
        }
        
        set {
            ageRatingGuide = newValue.ageRatingGuide
            averageRating = newValue.averageRating
            canonicalTitle = newValue.canonicalTitle
            coverImageTiny = newValue.coverImage?.tiny
            createdAt = newValue.createdAt
            endDate = newValue.endDate
            episodeCount = Int16(newValue.episodeCount ?? 0)
            episodeLength = Int16(newValue.episodeLength ?? 0)
            favoritesCount = Int16(newValue.favoritesCount)
            posterImageMedium = newValue.posterImage.medium
            posterImageTiny = newValue.posterImage.tiny
            startDate = newValue.startDate
            status = newValue.status
            subtype = newValue.subtype
            synopsis = newValue.synopsis
            updatedAt = newValue.updatedAt
            englishTitle = newValue.titles.english
            romajiTitle = newValue.titles.romaji
            japaneseTitle = newValue.titles.japanese
        }
        
    }
    
    func update(titlesData: TitleData) {
        self.id = titlesData.id
        self.type = titlesData.type
        
        self.attributes = titlesData.attributes
    }

    func configNew(titlesData: TitleData) {
        update(titlesData: titlesData)
    }
    
}

fileprivate extension TitleData {
    init(from cdRecord: TitleDataCDModel) {
        self.id = cdRecord.id
        self.type = cdRecord.type
        self.attributes = TitleAttributes(
            createdAt: cdRecord.createdAt,
            updatedAt: cdRecord.updatedAt,
            synopsis: cdRecord.synopsis,
            titles: Titles(
                english: cdRecord.englishTitle,
                romaji: cdRecord.romajiTitle,
                japanese: cdRecord.japaneseTitle),
            canonicalTitle: cdRecord.canonicalTitle,
            averageRating: cdRecord.averageRating,
            favoritesCount: Int(cdRecord.favoritesCount),
            startDate: cdRecord.startDate,
            endDate: cdRecord.endDate,
            ageRatingGuide: cdRecord.ageRatingGuide,
            subtype: cdRecord.subtype,
            status: cdRecord.status,
            posterImage: PosterImage(
                tiny: cdRecord.posterImageTiny,
                medium: cdRecord.posterImageMedium),
            coverImage: CoverImage(
                tiny: cdRecord.coverImageTiny),
            episodeCount: Int(cdRecord.episodeCount),
            episodeLength: Int(cdRecord.episodeLength))
    }
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

fileprivate extension Links {
    init(from cdRecord: LinksCDModel) {
        self.first = cdRecord.first ?? ""
        self.next = cdRecord.next ?? UserDefaults.standard.string(forKey: UserDefaultsKeys.apiLinkKey) ?? ""
        self.last = cdRecord.last ?? ""
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

fileprivate extension MetaInfo {
    init(from cdRecord: MetaCDModel) {
        self.count = Int(cdRecord.metaInfo)
    }
}


