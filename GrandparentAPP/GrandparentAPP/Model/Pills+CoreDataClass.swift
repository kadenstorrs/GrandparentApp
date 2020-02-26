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
        case image
        case checkMark
        case daysToTake
    }
    
    static var pillsEntity: String { return "Pills" }
    
    required convenience public init(from decoder: Decoder) throws {
        self.init(entity: NSEntityDescription.entity(forEntityName: Pills.pillsEntity, in: Stack.context)!, insertInto: Stack.context)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.prescription = try values.decode(String.self, forKey: CodingKeys.prescription)
        self.ndcNumber = try values.decode(String.self, forKey: CodingKeys.ndcNumber)
        self.timeOfDay = try values.decode(String.self, forKey: CodingKeys.timeOfDay)
        self.dosageType = try values.decode(String.self, forKey: CodingKeys.dosageType)
        self.image = try values.decode(Data?.self, forKey: CodingKeys.image)
        self.checkMark = try values.decode(Bool.self, forKey: CodingKeys.checkMark)
        self.daysToTake = try values.decode(String.self, forKey: CodingKeys.daysToTake)
    }
    

    convenience init?(prescription: String, ndcNumber: String, timeOfDay: String, dosageType: String, image: Data?, daysToTake: [DaysOfWeek], context: NSManagedObjectContext = Stack.context) {
        
        self.init(entity: NSEntityDescription.entity(forEntityName: Pills.pillsEntity, in: Stack.context)!, insertInto: Stack.context)
        
        self.prescription = prescription
        self.ndcNumber = ndcNumber
        self.timeOfDay = timeOfDay
        self.dosageType = dosageType
        self.image = image
        self.days = daysToTake
    }
    
   var days: [DaysOfWeek] {
     get {
       let componenets = daysToTake?.components(separatedBy: ",")
        return componenets?.compactMap{ Int($0) }.compactMap{ DaysOfWeek(rawValue: $0) } ?? []
     }
      
     set {
       daysToTake = newValue.reduce(""){ $0 + "," + String($1.rawValue) }
     }
   }
}


