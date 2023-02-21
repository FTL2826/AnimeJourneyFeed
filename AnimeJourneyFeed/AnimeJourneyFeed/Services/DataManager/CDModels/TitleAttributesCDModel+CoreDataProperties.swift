//
//  TitleAttributesCDModel+CoreDataProperties.swift
//  
//
//  Created by Александр Харин on /192/23.
//
//

import Foundation
import CoreData


extension TitleAttributesCDModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TitleAttributesCDModel> {
        return NSFetchRequest<TitleAttributesCDModel>(entityName: "TitleAttributesCDModel")
    }

    @NSManaged public var ageRatingGuide: String
    @NSManaged public var averageRating: String
    @NSManaged public var canonicalTitle: String
    @NSManaged public var coverImage: CoverImageCDModel
    @NSManaged public var createdAt: String
    @NSManaged public var endDate: String?
    @NSManaged public var episodeCount: Int16
    @NSManaged public var episodeLength: Int16
    @NSManaged public var favoritesCount: Int16
    @NSManaged public var posterImage: PosterImageCDModel
    @NSManaged public var startDate: String?
    @NSManaged public var status: String
    @NSManaged public var subtype: String
    @NSManaged public var synopsis: String
    @NSManaged public var titles: TitlesCDModel
    @NSManaged public var updatedAt: String

}
