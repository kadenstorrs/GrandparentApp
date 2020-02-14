//
//  Pill+CoreDataClass.swift
//  GrandparentAPP
//
//  Created by Ella  Neumarker on 2/12/20.
//  Copyright © 2020 Kaden Storrs. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Pills)
public class Pills: NSManagedObject, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case prescription
        case ndcNumber
        case timeOfDay
        case dosageType
        case endDate
    }

    static var pillsEntity: String { return "Pills" }

    required convenience public init(from decoder: Decoder) throws {
        self.init(entity: NSEntityDescription.entity(forEntityName: Pills.pillsEntity, in: Stack.context)!, insertInto: Stack.context)

        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.prescription = try values.decode(String.self, forKey: CodingKeys.prescription)
        self.ndcNumber = try values.decode(String.self, forKey: CodingKeys.ndcNumber)
        self.timeOfDay = try values.decode(String.self, forKey: CodingKeys.timeOfDay)
        self.dosageType = try values.decode(String.self, forKey: CodingKeys.dosageType)
        self.endDate = try values.decode(String.self, forKey: CodingKeys.dosageType)
    }
    
//     Create a required convenience init that takes a decoder
//     Inside of the init you need to decode each variable
    
    convenience init?(prescription: String, ndcNumber: String, timeOfDay: String, dosageType: String, endDate: String, context: NSManagedObjectContext = Stack.context) {

       self.init(entity: NSEntityDescription.entity(forEntityName: Pills.pillsEntity, in: Stack.context)!, insertInto: Stack.context)

        self.prescription = prescription
        self.ndcNumber = ndcNumber
        self.timeOfDay = timeOfDay
        self.dosageType = dosageType
        self.endDate = endDate
    }
}
