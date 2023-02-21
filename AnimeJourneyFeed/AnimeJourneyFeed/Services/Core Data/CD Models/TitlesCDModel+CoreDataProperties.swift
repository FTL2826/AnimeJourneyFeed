//
//  TitlesCDModel+CoreDataProperties.swift
//  
//
//  Created by Александр Харин on /212/23.
//
//

import Foundation
import CoreData


extension TitlesCDModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TitlesCDModel> {
        return NSFetchRequest<TitlesCDModel>(entityName: "TitlesCDModel")
    }

    @NSManaged public var english: String?
    @NSManaged public var japanese: String?
    @NSManaged public var romaji: String?

}
