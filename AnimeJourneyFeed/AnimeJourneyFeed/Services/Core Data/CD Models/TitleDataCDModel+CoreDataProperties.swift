//
//  TitleDataCDModel+CoreDataProperties.swift
//  
//
//  Created by Александр Харин on /212/23.
//
//

import Foundation
import CoreData


extension TitleDataCDModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TitleDataCDModel> {
        return NSFetchRequest<TitleDataCDModel>(entityName: "TitleDataCDModel")
    }

    @NSManaged public var ageRatingGuide: String
    @NSManaged public var averageRating: String
    @NSManaged public var canonicalTitle: String
    @NSManaged public var coverImageTiny: String?
    @NSManaged public var createdAt: String
    @NSManaged public var endDate: String?
    @NSManaged public var episodeCount: Int16
    @NSManaged public var episodeLength: Int16
    @NSManaged public var favoritesCount: Int16
    @NSManaged public var id: String
    @NSManaged public var posterImageMedium: String?
    @NSManaged public var posterImageTiny: String?
    @NSManaged public var startDate: String?
    @NSManaged public var status: String
    @NSManaged public var subtype: String
    @NSManaged public var synopsis: String
    @NSManaged public var type: String
    @NSManaged public var updatedAt: String
    @NSManaged public var englishTitle: String?
    @NSManaged public var romajiTitle: String?
    @NSManaged public var japaneseTitle: String?

}
