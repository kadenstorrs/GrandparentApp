//
//  PillDetail.swift
//  GrandparentAPP
//
//  Created by Ella  Neumarker on 1/27/20.
//  Copyright © 2020 Kaden Storrs. All rights reserved.
//

import Foundation


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
}
