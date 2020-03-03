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
        case datesTaken
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
        self.datesTaken = try values.decode(String.self, forKey: CodingKeys.datesTaken)
    }
    

    convenience init?(prescription: String, ndcNumber: String, timeOfDay: String, dosageType: String, image: Data?, daysToTake: [DaysOfWeek], datesTaken: [Date], context: NSManagedObjectContext = Stack.context) {
        
        self.init(entity: NSEntityDescription.entity(forEntityName: Pills.pillsEntity, in: Stack.context)!, insertInto: Stack.context)
        
        self.prescription = prescription
        self.ndcNumber = ndcNumber
        self.timeOfDay = timeOfDay
        self.dosageType = dosageType
        self.image = image
        self.days = daysToTake
        self.dates = datesTaken
    }
    
    var days: [DaysOfWeek] {
        get {
            let componenets = daysToTake?.components(separatedBy: ",")
            return componenets?.compactMap{ Int($0) }.compactMap{ DaysOfWeek(rawValue: $0) } ?? []
        }
        
        set {
            daysToTake = newValue.reduce(""){ $0 + ",\($1.rawValue)" }
        }
    }
    
    // create datesTaken: String variable in the entity
    var dates: [Date] {
        get {
            let components = datesTaken?.components(separatedBy: ",")
            return components?.compactMap{ DateFormatter.short.date(from: $0)?.timeRemoved() } ?? []
            // split the string by the "," character
            // map the string array to an array of Dates using the DateFormatter.short.date(from: String)
        }
        
        set {
            
            datesTaken = newValue.compactMap( { DateFormatter.short.string(from: $0) } ).reduce(""){ $0 + ",\($1)"}
            // take `newValue` (which is an array of Dates) and reduce it to a String with "," separated string dates using the DateFormatter.short.string(from: Date)
            // [2/3/20, 1/3/20] would turn into ",2/3/20,1/3/20"
            // assign the value to `datesTaken`
        }
    }
    
}


