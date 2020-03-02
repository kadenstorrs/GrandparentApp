//
//  PillsController.swift
//  GrandparentAPP
//
//  Created by Ella  Neumarker on 2/13/20.
//  Copyright © 2020 Kaden Storrs. All rights reserved.
//

import Foundation
import CoreData

class PillsController {
    
    static let sharedController = PillsController()
    
    func pill() -> [Pills] {
        
        let request: NSFetchRequest<Pills> = Pills.fetchRequest()
        
        do {
            return try Stack.context.fetch(request)
        } catch {
            return []
        }
    }
    
    func delete(pill: Pills) {
        Stack.context.delete(pill)
        save()
    }
    
    func save() {
        Stack.saveContext()
    }
}
