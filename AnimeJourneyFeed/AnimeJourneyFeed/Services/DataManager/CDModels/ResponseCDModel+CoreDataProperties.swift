//
//  ResponseCDModel+CoreDataProperties.swift
//  
//
//  Created by Александр Харин on /192/23.
//
//

import Foundation
import CoreData


extension ResponseCDModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ResponseCDModel> {
        return NSFetchRequest<ResponseCDModel>(entityName: "ResponseCDModel")
    }

    @NSManaged public var data: TitleDataCDModel?
    @NSManaged public var links: LinksCDModel?
    @NSManaged public var meta: MetaCDModel?

}
