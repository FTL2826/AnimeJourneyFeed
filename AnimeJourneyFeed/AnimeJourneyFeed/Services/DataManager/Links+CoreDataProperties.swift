//
//  Links+CoreDataProperties.swift
//  
//
//  Created by Александр Харин on /182/23.
//
//

import Foundation
import CoreData


extension Links {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Links> {
        return NSFetchRequest<Links>(entityName: "Links")
    }

    @NSManaged public var first: String?
    @NSManaged public var next: String?
    @NSManaged public var last: String?

}
