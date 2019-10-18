import SwiftUI

struct StyledDate {
    var date : Date
    var isPast : Bool = false
    var isToday : Bool = false
    var isSelected : Bool = false
    var isWeekend : Bool = false
    var isLeapDay : Bool = false
    var isLongSat : Bool = false
    
    init(date: Date, isPast: Bool, isToday: Bool, isSelected: Bool, isWeekend: Bool, isLeapDay: Bool, isLongSat: Bool) {
        self.date = date
        self.isPast = isPast
        self.isToday = isToday
        self.isSelected = isSelected
        self.isWeekend = isWeekend
        self.isLeapDay = isLeapDay
        self.isLongSat = isLongSat
    }
    
    func getText() -> String {
        //set formatter
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.calendar = calendar
        formatter.dateFormat = "d"
        
        let day = formatter.string(from: date)
        return day
    }
    
    func getTextColor() -> Color{
        var textColor = Color.white
        if isWeekend {
            textColor = Color.yellow
        }else if isPast {
            textColor = Color.white
        }else if isSelected || isToday{
            textColor = Color.white
        }
        
        return textColor
    }
    
    func getBackgroundColor() -> Color{
        var backgroundColor = Color.clear
        
        if isSelected {
            backgroundColor = Color.red
        }else if isPast {
            backgroundColor = Color.clear
        }else if isToday {
            backgroundColor = Color.blue
        }
        
        return backgroundColor
    }
    
    func getFontWight() -> Font.Weight {
        var fontWeight = Font.Weight.medium
        
        if isPast {
            fontWeight = Font.Weight.thin
        }else if isSelected || isToday {
            fontWeight = Font.Weight.heavy
        }
        
        return fontWeight
    }
    
}

