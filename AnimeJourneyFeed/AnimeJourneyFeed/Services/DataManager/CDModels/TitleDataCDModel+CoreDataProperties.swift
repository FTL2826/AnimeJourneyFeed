//
//  TitleDataCDModel+CoreDataProperties.swift
//  
//
//  Created by Александр Харин on /192/23.
//
//

import Foundation
import CoreData


extension TitleDataCDModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TitleDataCDModel> {
        return NSFetchRequest<TitleDataCDModel>(entityName: "TitleDataCDModel")
    }

    @NSManaged public var attributes: TitleAttributesCDModel?
    @NSManaged public var id: String
    @NSManaged public var type: String

}
