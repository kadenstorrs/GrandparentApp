//
//  Pills+CoreDataClass.swift
//  GrandparentAPP
//
//  Created by Ella  Neumarker on 2/19/20.
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
        case image
        case checkMark
    }
    
    static var pillsEntity: String { return "Pills" }
    
    required convenience public init(from decoder: Decoder) throws {
        self.init(entity: NSEntityDescription.entity(forEntityName: Pills.pillsEntity, in: Stack.context)!, insertInto: Stack.context)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.prescription = try values.decode(String.self, forKey: CodingKeys.prescription)
        self.ndcNumber = try values.decode(String.self, forKey: CodingKeys.ndcNumber)
        self.timeOfDay = try values.decode(String.self, forKey: CodingKeys.timeOfDay)
        self.dosageType = try values.decode(String.self, forKey: CodingKeys.dosageType)
        self.endDate = try values.decode(String.self, forKey: CodingKeys.endDate)
        self.image = try values.decode(Data?.self, forKey: CodingKeys.image)
        self.checkMark = try values.decode(Bool.self, forKey: CodingKeys.checkMark)
    }
    
    convenience init?(prescription: String, ndcNumber: String, timeOfDay: String, dosageType: String, endDate: String, image: Data?, context: NSManagedObjectContext = Stack.context) {
        
        self.init(entity: NSEntityDescription.entity(forEntityName: Pills.pillsEntity, in: Stack.context)!, insertInto: Stack.context)
        
        self.prescription = prescription
        self.ndcNumber = ndcNumber
        self.timeOfDay = timeOfDay
        self.dosageType = dosageType
        self.endDate = endDate
        self.image = image
    }
}


