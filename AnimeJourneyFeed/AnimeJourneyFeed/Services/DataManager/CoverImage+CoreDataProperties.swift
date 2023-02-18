//
//  CoverImage+CoreDataProperties.swift
//  
//
//  Created by Александр Харин on /182/23.
//
//

import Foundation
import CoreData


extension CoverImage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoverImage> {
        return NSFetchRequest<CoverImage>(entityName: "CoverImage")
    }

    @NSManaged public var tiny: String?

}
