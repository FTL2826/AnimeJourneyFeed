//
//  Titles+CoreDataProperties.swift
//  
//
//  Created by Александр Харин on /182/23.
//
//

import Foundation
import CoreData


extension Titles {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Titles> {
        return NSFetchRequest<Titles>(entityName: "Titles")
    }

    @NSManaged public var english: String?
    @NSManaged public var romaji: String?
    @NSManaged public var japanese: String?

}
