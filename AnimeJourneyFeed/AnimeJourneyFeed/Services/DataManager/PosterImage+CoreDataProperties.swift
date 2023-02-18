//
//  PosterImage+CoreDataProperties.swift
//  
//
//  Created by Александр Харин on /182/23.
//
//

import Foundation
import CoreData


extension PosterImage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PosterImage> {
        return NSFetchRequest<PosterImage>(entityName: "PosterImage")
    }

    @NSManaged public var tiny: String?
    @NSManaged public var medium: String?

}
