import SwiftUI

struct CalendarWeekdays: View {
    @State var type: calendarType
    
    var body: some View {
        HStack(alignment: .center){
            ForEach(getWeekdays(), id: \.self) { weekday in
                Text(weekday)
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(Color.yellow)
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
        CalendarWeekdays(type: .Gregorian)
            .previewLayout(.fixed(width: 600, height: 70))
    }
}
