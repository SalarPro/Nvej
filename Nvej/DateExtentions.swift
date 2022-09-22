//
//  DateExtentions.swift
//  FastDay
//
//  Created by Salar Pro MacMini on 11/15/21.
//

import Foundation

extension Date {
    
//    func adding(minutes: Int) -> Date {
//        return Calendar.current.date(byAdding: .minute, value: minutes, to: self)!
//    }
//    func adding(seconds: Int) -> Date {
//        return Calendar.current.date(byAdding: .second, value: seconds, to: self)!
//    }
//    func adding(hour: Int) -> Date {
//        return Calendar.current.date(byAdding: .hour, value: hour, to: self)!
//    }
//    func adding(days: Int) -> Date {
//        return Calendar.current.date(byAdding: .day, value: days, to: self)!
//    }
//    func adding(_ type: Calendar.Component ,value : Int) -> Date {
//        return Calendar.current.date(byAdding: type, value: value, to: self)!
//    }
//
//
//    //by Salar Pro
//    ///convert string "23:55" to Date
//    func fromTimeString(time: String) -> Date? {
//        // Create Date Formatter
//        let dateFormatter = DateFormatter()
//        // Set Date Format
//        dateFormatter.dateFormat = "HH:mm"
//        // Convert String to Date
//        return dateFormatter.date(from: time)
//    }
    
    //by Salar Pro
    ///convert string "yyyy-MM-dd HH:mm" to Date
//    static func fromDateTimeString(yyyy_MM_dd_HH_mm time: String, format: String = "yyyy-MM-dd HH:mm") -> Date? {
//        // Create Date Formatter
//        let dateFormatter = DateFormatter()
//        // Set Date Format
//        dateFormatter.dateFormat = format
//        // Convert String to Date
//        return dateFormatter.date(from: time)
//    }
    
    func toString(_ format: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en")
        formatter.dateStyle = .none
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
//
//
//    func toString_yyyy_MM_dd_HH_mm_sss(_ format: String = "yyyy-MM-dd HH:mm:sss") -> String {
//        let formatter = DateFormatter(withFormat: format, locale: "en")
//        formatter.dateStyle = .none
//        formatter.dateFormat = format
//        return formatter.string(from: self)
//    }
//
//    func dateAndTimetoString(_ format: String = "yyyy-MM-dd HH:mm") -> String {
//        let formatter = DateFormatter(withFormat: format, locale: "en")
//
////        formatter.locale = Locale(identifier: "en") //Locale(localeIdentifier: "en")
//        formatter.dateStyle = .none
//        formatter.dateFormat = format
//
//        return formatter.string(from: self)
//    }
//
    func timeIn24HourFormat() -> String {
        let formatter =  DateFormatter()
        formatter.locale = Locale(identifier: "en")
        formatter.dateStyle = .none
        formatter.dateFormat = "H:mm"
        return formatter.string(from: self)
    }


    func timeIn12HourFormat() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en")
        formatter.dateStyle = .none
        formatter.dateFormat = "h:m"
        return formatter.string(from: self)
    }
//
//    func startOfMonth() -> Date {
//        var components = Calendar.current.dateComponents([.year,.month], from: self)
//        components.day = 1
//        let firstDateOfMonth: Date = Calendar.current.date(from: components)!
//        return firstDateOfMonth
//    }
//
//    func endOfMonth() -> Date {
//        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
//    }
//
    func nextDate() -> Date {
        let nextDate = Calendar.current.date(byAdding: .day, value: 1, to: self)
        return nextDate ?? Date()
    }
//
//    func previousDate() -> Date {
//        let previousDate = Calendar.current.date(byAdding: .day, value: -1, to: self)
//        return previousDate ?? Date()
//    }
//
//    func addMonths(numberOfMonths: Int) -> Date {
//        let endDate = Calendar.current.date(byAdding: .month, value: numberOfMonths, to: self)
//        return endDate ?? Date()
//    }
//
//    func removeMonths(numberOfMonths: Int) -> Date {
//        let endDate = Calendar.current.date(byAdding: .month, value: -numberOfMonths, to: self)
//        return endDate ?? Date()
//    }
//
//    func removeYears(numberOfYears: Int) -> Date {
//        let endDate = Calendar.current.date(byAdding: .year, value: -numberOfYears, to: self)
//        return endDate ?? Date()
//    }
//
//    func getHumanReadableDayString(_ weekIndex: Int? = nil) -> String {
//        let weekdays = [
//            "Saturday".localized(),     //7     0
//            "Sunday".localized(),       //1     1
//            "Monday".localized(),       //2     2
//            "Tuesday".localized(),      //3     3
//            "Wednesday".localized(),    //4     4
//            "Thursday".localized(),     //5     5
//            "Friday".localized(),       //6     6
//        ]
//
//
//        if let weekInd = weekIndex{
//            return weekdays[weekInd]
//        }
//        //  1   2   3   4   5   6   7
//        //  2   3   4   5   6   7   0
//        //  2
//
//        //  u   m   t   w   h   f   s
//        //  1   2   3   4   5   6   7
//        //  w   w   w   w   w   w   0
//        let calendar = Calendar.current.component(.weekday, from: self)
//        return weekdays[calendar == 7 ? 0 : calendar]
//    }
//
//    func getIndexOfWeek() -> Int{
//        let calendar = Calendar.current.component(.weekday, from: self) //+ 1
//        return calendar >= 7 ? 0 : calendar
//    }
//
//    func indexIfWeekDay() -> Int {
//        return Calendar.current.component(.weekday, from: self)
//    }
//
//
//    func timeSinceDate(fromDate: Date = Date()) -> String {
//        let earliest = self < fromDate ? self  : fromDate
//        let latest = (earliest == self) ? fromDate : self
//
//        let components:DateComponents = Calendar.current.dateComponents([.minute,.hour,.day,.weekOfYear,.month,.year,.second], from: earliest, to: latest)
//        let year = components.year  ?? 0
//        let month = components.month  ?? 0
//        let week = components.weekOfYear  ?? 0
//        let day = components.day ?? 0
//        let hours = components.hour ?? 0
//        let minutes = components.minute ?? 0
//        let seconds = components.second ?? 0
//
//        if currentLanguage == KurdishBadini{
//            if year >= 2{
//                return  "بەری \(year) سالا"
//            }else if (year >= 1){
//                return "1 year ago".localized()
//            }else if (month >= 2) {
//                return  "بەری \(month) هەیڤا"
//            }else if (month >= 1) {
//                return "1 month ago".localized()
//            }else  if (week >= 2) {
//                return  "بەری \(week) حەفتیا"
//            } else if (week >= 1){
//                return "1 week ago".localized()
//            } else if (day >= 2) {
//                return "بەری \(day) روژا"
//            } else if (day >= 1){
//                return "1 day ago".localized()
//            } else if (hours >= 2) {
//                return  "بەری \(hours) دەمژمێرا"
//            } else if (hours >= 1){
//                return "1 hour ago".localized()
//            } else if (minutes >= 2) {
//                return "بەری \(minutes) خولەکا"
//            } else if (minutes >= 1){
//                return "1 minute ago".localized()
//            } else if (seconds >= 3) {
//                return "بەری \(seconds) چرکا"
//            } else {
//                return "Just now".localized()
//            }
//        }
//
//        if year >= 2{
//            return "\(year) \("years ago".localized())"
//        }else if (year >= 1){
//            return "1 year ago".localized()
//        }else if (month >= 2) {
//            return "\(month) \("months ago".localized())"
//        }else if (month >= 1) {
//            return "1 month ago".localized()
//        }else  if (week >= 2) {
//            return "\(week) \("weeks ago".localized())"
//        } else if (week >= 1){
//            return "1 week ago".localized()
//        } else if (day >= 2) {
//            return "\(day) \("days ago".localized())"
//        } else if (day >= 1){
//            return "1 day ago".localized()
//        } else if (hours >= 2) {
//            return "\(hours) \("hours ago".localized())"
//        } else if (hours >= 1){
//            return "1 hour ago".localized()
//        } else if (minutes >= 2) {
//            return "\(minutes) \("minutes ago".localized())"
//        } else if (minutes >= 1){
//            return "1 minute ago".localized()
//        } else if (seconds >= 3) {
//            return "\(seconds) \("seconds ago".localized())"
//        } else {
//            return "Just now".localized()
//        }
//
//
//
//    }
}

