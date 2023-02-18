//
//  TitleAttributes+CoreDataProperties.swift
//  
//
//  Created by Александр Харин on /182/23.
//
//

import Foundation
import CoreData


extension TitleAttributes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TitleAttributes> {
        return NSFetchRequest<TitleAttributes>(entityName: "TitleAttributes")
    }

    @NSManaged public var createdAt: String
    @NSManaged public var updatedAt: String
    @NSManaged public var synopsis: String
    @NSManaged public var titles: Titles
    @NSManaged public var canonicalTitle: String
    @NSManaged public var averageRating: String
    @NSManaged public var favoritesCount: Int16
    @NSManaged public var startDate: String?
    @NSManaged public var endDate: String?
    @NSManaged public var ageRatingGuide: String
    @NSManaged public var subtype: String
    @NSManaged public var status: String
    @NSManaged public var posterImage: PosterImage
    @NSManaged public var coverImage: CoverImage?
    @NSManaged public var episodeCount: Int16?
    @NSManaged public var episodeLength: Int16?

}
