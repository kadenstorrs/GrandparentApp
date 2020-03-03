//
//  DaysOfWeek.swift
//  GrandparentAPP
//
//  Created by Kaden Storrs on 2/7/20.
//  Copyright © 2020 Kaden Storrs. All rights reserved.
//

import Foundation

enum DaysOfWeek: Int {
    case sunday = 1
    case monday = 2
    case tuesday = 3
    case wednesday = 4
    case thursday = 5
    case friday = 6
    case saturday = 7
    
    var date: Date {
        switch self {
        case .sunday:
            return Date.sunday.timeRemoved()
        case .monday:
            return Date.monday.timeRemoved()
        case .tuesday:
            return Date.tuesday.timeRemoved()
        case .wednesday:
            return Date.wednesday.timeRemoved()
        case .thursday:
            return Date.thursday.timeRemoved()
        case .friday:
            return Date.friday.timeRemoved()
        case .saturday:
            return Date.saturday.timeRemoved()
        }
    }
}
