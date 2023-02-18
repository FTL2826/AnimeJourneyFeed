//
//  TitleData+CoreDataProperties.swift
//  
//
//  Created by Александр Харин on /182/23.
//
//

import Foundation
import CoreData


extension TitleData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TitleData> {
        return NSFetchRequest<TitleData>(entityName: "TitleData")
    }

    @NSManaged public var id: String
    @NSManaged public var type: String
    @NSManaged public var attributes: TitleAttributes

}
