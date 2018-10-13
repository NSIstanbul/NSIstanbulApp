//
//  Date+EventPrintable.swift
//  NSIstanbul
//
//  Created by BILAL ARSLAN on 24.09.2018.
//  Copyright © 2018 NSIstanbul. All rights reserved.
//

import Foundation

extension Date {

    func getDay() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: self)
    }

    func getMonth() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        return formatter.string(from: self)
    }

    func getEventFormattedTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E\nHH:mm"
        return formatter.string(from: self)
    }

}
