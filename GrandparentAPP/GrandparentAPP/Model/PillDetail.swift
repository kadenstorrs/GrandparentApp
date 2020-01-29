//
//  PillDetail.swift
//  GrandparentAPP
//
//  Created by Ella  Neumarker on 1/27/20.
//  Copyright © 2020 Kaden Storrs. All rights reserved.
//

import Foundation
import UIKit


struct Pill: Codable {
    var prescription: String
    var ndcNumber: String
    var dosageType: String
    var endDate: String
    var imageData: Data?
    
    init(prescription: String, ndcNumber: String, dosageType: String, endDate: String, imageData: Data? = nil) {
        self.prescription = prescription
        self.ndcNumber = ndcNumber
        self.dosageType = dosageType
        self.endDate = endDate
        self.imageData = imageData
    }
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("pill_test").appendingPathExtension("plist")
    
    static func saveToFile(pills: [Pill]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedPills = try? propertyListEncoder.encode(pills)
       
        try? encodedPills?.write(to: Pill.archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Pill]? {
        
        guard let codedPills = try? Data(contentsOf: Pill.archiveURL) else { return nil }
        
        let propertyListDecoder = PropertyListDecoder()
        
        return try? propertyListDecoder.decode([Pill].self, from: codedPills)
    }
    
    
}
