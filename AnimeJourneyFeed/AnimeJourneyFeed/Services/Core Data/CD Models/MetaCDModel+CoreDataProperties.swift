//
//  MetaCDModel+CoreDataProperties.swift
//  
//
//  Created by Александр Харин on /212/23.
//
//

import Foundation
import CoreData


extension MetaCDModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MetaCDModel> {
        return NSFetchRequest<MetaCDModel>(entityName: "MetaCDModel")
    }

    @NSManaged public var metaInfo: Int16

}
