//
//  PosterImageCDModel+CoreDataProperties.swift
//  
//
//  Created by Александр Харин on /192/23.
//
//

import Foundation
import CoreData


extension PosterImageCDModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PosterImageCDModel> {
        return NSFetchRequest<PosterImageCDModel>(entityName: "PosterImageCDModel")
    }

    @NSManaged public var medium: String?
    @NSManaged public var tiny: String?

}
