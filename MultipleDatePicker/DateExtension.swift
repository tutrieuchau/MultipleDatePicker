//
//  DateExtension.swift
//  SGADatePicker
//
//  Created by Tam on 6/15/19.
//  Copyright © 2019 SaiGonApps Team. All rights reserved.
//
import UIKit
extension Date {
    
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    func firstDateOfYear() -> Date{
        let year = Calendar.current.component(.year, from: self)
        return Calendar.current.date(from: DateComponents(year: year, month: 1, day: 1))!
    }
    
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
    func lastMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: -1, day: 0), to: self)!
    }
    func nextMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: 0), to: self)!
    }
    func lastYear() -> Date{
        return Calendar.current.date(byAdding: DateComponents(month: -12, day: 0), to: self)!
    }
    func nextYear() -> Date{
        return Calendar.current.date(byAdding: DateComponents(month: 12, day: 0), to: self)!
    }
    func daysLater(offset: Int) -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 0, day: offset), to: self)!
    }
    func daysAgo(offset: Int) -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 0, day: -offset), to: self)!
    }
    
    func getDateString() -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd"
        return dateFormatterPrint.string(from: self)
    }
    
    func getShortMonthDateString() -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd"
        return dateFormatterPrint.string(from: self)
    }
    
    func getMonthString() -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "LLLL"
        return dateFormatterPrint.string(from: self)
    }
    func getShortMonthString() -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM"
        return dateFormatterPrint.string(from: self)
    }
    func getYearString() -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy"
        return dateFormatterPrint.string(from: self)
    }
    
    func daysOfMonth() -> Int? {
        let calendar = Calendar.current
        let interval = calendar.dateInterval(of: .month, for: self)!
        let days = calendar.dateComponents([.day], from: interval.start, to: interval.end).day
        return days
    }
}


