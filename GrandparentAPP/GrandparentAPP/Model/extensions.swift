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


extension Date {
    
    func timeRemoved() -> Date {
        
        let myCalendar = Calendar.current
        let newTime = myCalendar.date(bySettingHour: 0, minute: 0, second: 0, of: Date())
        // set the time to 0.00 AM
        // return the new date with the 0.0 time
        return newTime ?? Date()
    }
    
    private static func date(for dayOfWeek: DaysOfWeek) -> Date {
        let myCalendar = Calendar.current
        let weekday = myCalendar.component(.weekday, from: Date())
        let diff = dayOfWeek.rawValue - weekday
        let mondayDate = myCalendar.date(byAdding: .weekday, value: diff, to: Date(), wrappingComponents: false)
        // convert to string with DateFormatter.short
        // convert back to date with DateFormatter.short
        return mondayDate ?? Date()
    }
    static var sunday: Date {
        return date(for: .sunday)
    }
    
    static var monday: Date {
        return date(for: .monday)
    }
    
    static var tuesday: Date {
        return date(for: .tuesday)
    }
    
    static var wednesday: Date {
        return date(for: .wednesday)
    }
    
    static var thursday: Date {
        return date(for: .thursday)
    }
    
    static var friday: Date {
        return date(for: .friday)
    }
    
    static var saturday: Date {
        return date(for: .saturday)
    }
    
}
