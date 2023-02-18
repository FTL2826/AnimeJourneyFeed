//
//  Response+CoreDataProperties.swift
//  
//
//  Created by Александр Харин on /182/23.
//
//

import Foundation
import CoreData


extension Response {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Response> {
        return NSFetchRequest<Response>(entityName: "Response")
    }

    @NSManaged public var data: [TitleData]
    @NSManaged public var meta: Meta
    @NSManaged public var links: Links

}
