//
//  Extensions.swift
//  
//
//  Created by Anjan Kumar Majumder on 1/8/21.
//  Copyright © 2021 Anjan. All rights reserved.
//

import Foundation

public extension Calendar {
    static let now: Calendar = {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone.current
        return calendar
    }()
}

public extension Date {
    ///UTC in Local Time
    var utcInLocalTime: Date {
        var components = DateComponents()
        components.second = TimeZone.current.secondsFromGMT(for: self)

        return Calendar.now.date(byAdding: components, to: self)!
    }
}
