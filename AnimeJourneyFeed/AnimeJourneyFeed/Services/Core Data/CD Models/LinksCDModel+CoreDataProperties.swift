//
//  LinksCDModel+CoreDataProperties.swift
//  
//
//  Created by Александр Харин on /212/23.
//
//

import Foundation
import CoreData


extension LinksCDModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LinksCDModel> {
        return NSFetchRequest<LinksCDModel>(entityName: "LinksCDModel")
    }

    @NSManaged public var first: String?
    @NSManaged public var last: String?
    @NSManaged public var next: String?

}
