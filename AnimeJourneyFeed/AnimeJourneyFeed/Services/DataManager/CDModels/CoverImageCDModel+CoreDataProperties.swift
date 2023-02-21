//
//  CoverImageCDModel+CoreDataProperties.swift
//  
//
//  Created by Александр Харин on /192/23.
//
//

import Foundation
import CoreData


extension CoverImageCDModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoverImageCDModel> {
        return NSFetchRequest<CoverImageCDModel>(entityName: "CoverImageCDModel")
    }

    @NSManaged public var tiny: String?

}
