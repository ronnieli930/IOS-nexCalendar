import Foundation
import Combine

enum calendarType {
    case Gregorian
    case Nex
}

struct FormattedDate : Comparable {
    var year: Int
    var month: Int
    var day: Int
    
    init(date: Date) {
        let y = calendar.component(.year, from: date)
        let m = calendar.component(.month, from: date)
        let d = calendar.component(.day, from: date)
        self.year = y
        self.month = m
        self.day = d
    }
    
    static func == (lhs: FormattedDate, rhs: FormattedDate) -> Bool {
        return lhs.year == rhs.year && lhs.month == rhs.month && lhs.day == rhs.day
    }
    
    static func < (lhs: FormattedDate, rhs: FormattedDate) -> Bool {
        if lhs.year != rhs.year {
            return lhs.year < rhs.year
        } else if lhs.month != rhs.month {
            return lhs.month < rhs.month
        } else {
            return lhs.day < rhs.day
        }
    }
    
}


let calendar = Calendar.current
let today = Date()

//test
var component = DateComponents(calendar: calendar, year: 2020, month: 12, day: 31)
//let today = calendar.date(from: component)!

func monthToString(month: Int) -> String {
    return monthArr[month - 1]
}

