import SwiftUI

struct CalendarWeekdays: View {
    @State var type: calendarType
    @Binding var themeColor: ThemeColor
    
    var body: some View {
        HStack(alignment: .center){
            ForEach(getWeekdays(), id: \.self) { weekday in
                Text(weekday)
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(getThemeMainColor(theme: self.themeColor))
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
        }
    }
    
    func getWeekdays() -> [String] {
        return self.type == calendarType.Gregorian ? gregorianWeekdays : nexWeekdays
    }
}

struct CalendarWeekdays_Previews: PreviewProvider {
    static var previews: some View {
        CalendarWeekdays(type: .Gregorian, themeColor: .constant(ThemeColor.dark))
            .previewLayout(.fixed(width: 600, height: 70))
    }
}
