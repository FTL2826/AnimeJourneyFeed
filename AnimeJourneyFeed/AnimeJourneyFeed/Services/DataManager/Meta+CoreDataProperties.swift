//
//  Meta+CoreDataProperties.swift
//  
//
//  Created by Александр Харин on /182/23.
//
//

import Foundation
import CoreData


extension Meta {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meta> {
        return NSFetchRequest<Meta>(entityName: "Meta")
    }

    @NSManaged public var metaInfo: Int16

}
