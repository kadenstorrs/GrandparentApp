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
public class Pills: NSManagedObject {
    
    static var pillsEntity: String { return "Pills" }

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
    
    var dates: [Date] {
        get {
            let components = datesTaken?.components(separatedBy: ",")
            return components?.compactMap{ DateFormatter.short.date(from: $0)?.timeRemoved() } ?? []
        }
        
        set {
            datesTaken = newValue.compactMap( { DateFormatter.short.string(from: $0) } ).reduce(""){ $0 + ",\($1)"}
        }
    }
}


