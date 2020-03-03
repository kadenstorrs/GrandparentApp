//
//  extensions.swift
//  GrandparentAPP
//
//  Created by Ella  Neumarker on 3/3/20.
//  Copyright © 2020 Kaden Storrs. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static var short: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "M/d/yy"
        return formatter
    }
    
}
