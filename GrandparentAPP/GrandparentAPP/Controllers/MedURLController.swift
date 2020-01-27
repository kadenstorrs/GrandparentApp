//
//  MedURLController.swift
//  PillBoxView
//
//  Created by Kaden Storrs on 1/21/20.
//  Copyright © 2020 Kaden Storrs. All rights reserved.
//

import Foundation

struct Meds: Codable {
    var results: [Packaging]
}

struct Packaging: Codable {
    var generic_name: String
    var product_ndc: String
    var dosage_form: String
}

//struct ActiveIngredients: Codable {
//    var strength: String
//}
