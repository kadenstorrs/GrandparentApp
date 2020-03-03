//
//  Pills+CoreDataProperties.swift
//  GrandparentAPP
//
//  Created by Ella  Neumarker on 2/26/20.
//  Copyright © 2020 Kaden Storrs. All rights reserved.
//
//

import Foundation
import CoreData


extension Pills {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pills> {
        return NSFetchRequest<Pills>(entityName: "Pills")
    }

    @NSManaged public var checkMark: Bool
    @NSManaged public var dosageType: String?
    @NSManaged public var image: Data?
    @NSManaged public var ndcNumber: String?
    @NSManaged public var prescription: String?
    @NSManaged public var timeOfDay: String?
    @NSManaged public var daysToTake: String?
    @NSManaged public var datesTaken: String? 

}
