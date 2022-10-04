//
//  DateExt.swift
//  Kiliaro
//
//  Created by Little Developers on 04/10/2022.
//

import Foundation


extension Date {
    static func parseServerDate(dateString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        formatter.locale = Locale(identifier: Locale.current.languageCode ?? "en")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter.date(from: dateString)
    }
    
    func dateFormat() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: Locale.current.languageCode ?? "en")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: self)
    }
    
    func timeFormat() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: Locale.current.languageCode ?? "en")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: self)
    }
}
