import SwiftUI

struct GregorianView: View {
    @Binding var themeColor: ThemeColor
    
    @State var selectedDay: Date?
    @Binding var displayYear: Int
    @Binding var displayMonth: Int
    @Binding var offset: CGSize
    let todayYMD = FormattedDate(date: today)
    let daysPerWeek = 7
    var monthsArr: [[Date]] {
        monthArray()
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(monthToString(month: displayMonth) + " " + String(displayYear))
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .padding([.top, .leading])
                Spacer()
                Text("Gregorian")
                    .foregroundColor(Color.gray)
                    .padding([.top, .trailing])
            }
            Divider()
            CalendarWeekdays(type: .Gregorian, themeColor: self.$themeColor)
                .padding(.horizontal, 10)
            VStack(alignment: .leading, spacing: 5) {
                ForEach(monthsArr, id:  \.self) { week in
                    HStack {
                        ForEach(week, id:  \.self) { day in
                            HStack() {
                                Spacer()
                                if self.isInCurrentMonth(day: day){
                                    CalendarCell(styledDate: StyledDate(
                                        date: day,
                                        isPast: self.isPast(day: day),
                                        isToday: self.isToday(day: day),
                                        isSelected: self.selectedDay == day,
                                        isWeekend: self.isWeekend(day: day),
                                        isLeapDay: self.isLeapDay(day: day),
                                        isLongSat: false,
                                        theme: self.themeColor
                                    )).onTapGesture {
                                        self.handleOnTapped(day: day)
                                    }
                                }
                                else {
                                    Text("")
                                }
                                Spacer()
                            }
                        }
                    }
                }
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
        }.background(
            Rectangle()
                .foregroundColor(Color.black)
                .opacity(isOnchange(offset: offset) ? 0.4 : 0.8))
            .cornerRadius(20)
            .padding(.horizontal, 5)
            .clipped()
            .shadow(radius: 15)
            .offset(x: self.offset.width)
            .gesture(DragGesture()
                .onChanged { value in
                    self.offset = value.translation}
                .onEnded { value in
                    self.offset = CGSize.zero
                    if value.translation.width < -150 {
                        self.addMonth()
                    }else if value.translation.width > 150 {
                        self.minusMonth()
                    }})
            .gesture(TapGesture(count: 2)
                .onEnded({self.changeToToday()}))
            .animation(.easeInOut)
    }
    
    func handleOnTapped(day: Date) {
        selectedDay = day
    }
    
    func monthArray() -> [[Date]]{
        var month = [[Date]]()
        let offset = getMonthOffset()
        for row in 0 ... ((numberOfDays(offset: offset)) / 7){
            var week = [Date]()
            for col in 1 ... 7 {
                let day = self.getDateAtIndex(index: (row * 7) + col - offset)
                week.append(day)
            }
            month.append(week)
        }
        
        return month
    }
    
    func numberOfDays(offset: Int) -> Int {
        //getDayNumbers
        var monthComponent = DateComponents()
        monthComponent.setValue(displayYear, for: .year)
        monthComponent.setValue(displayMonth, for: .month)
        let range = calendar.range(of: .day, in: .month, for: calendar.date(from: monthComponent)!)
        let dayCount = (range?.count)!
        
        return offset + dayCount
    }
    
    func getDateAtIndex(index: Int) -> Date {
        var date = DateComponents()
        date.setValue(displayYear, for: .year)
        date.setValue(displayMonth, for: .month)
        date.setValue(index, for: .day)
        let dateAtIndex = calendar.date(from: date)!
        
        return dateAtIndex
    }
    
    func getMonthOffset() -> Int {
        let firstDayInMonth = getFirstDayOfMonth(year: displayYear, month: displayMonth)
        let offset = calendar.component(.weekday, from: firstDayInMonth) - 1
        return offset
    }
    
    func getFirstDayOfMonth(year: Int, month: Int) -> Date {
        var firstDay = DateComponents()
        firstDay.setValue(year, for: .year)
        firstDay.setValue(month, for: .month)
        firstDay.setValue(1, for: .day)
        return calendar.date(from: firstDay)!
    }
    
    func isInCurrentMonth(day: Date) -> Bool {
        let isSameYear = calendar.component(.year, from: day) == displayYear
        let isSameMonth = calendar.component(.month, from: day) == displayMonth
        return isSameYear && isSameMonth
    }
    
    func isWeekend(day: Date) -> Bool {
        let isWeekend = calendar.component(.weekday, from: day) == 1 || calendar.component(.weekday, from: day) == 7
        return isWeekend
    }
    
    func isToday(day: Date) -> Bool {
        let ymd = FormattedDate(date: day)
        return ymd == todayYMD
    }
    
    func isPast(day: Date) -> Bool {
        let ymd = FormattedDate(date: day)
        return ymd < todayYMD
    }
    
    func isLeapDay(day: Date) -> Bool {
        let ymd = FormattedDate(date: day)
        return ymd.month == 2 && ymd.day == 29
    }
    
    func isOnchange(offset: CGSize) -> Bool {
        let value = offset.width
        return value > 150 || value < -150
    }
    
    func changeToToday() {
        self.displayYear = todayYMD.year
        self.displayMonth = todayYMD.month
    }
    
    func addMonth() {
        if self.displayMonth == 12 {
            self.displayMonth = 1
            self.displayYear += 1
        }else {
            self.displayMonth += 1
        }
    }
    
    func minusMonth() {
        if self.displayMonth == 1 {
            self.displayMonth = 12
            self.displayYear -= 1
        }else {
            self.displayMonth -= 1
        }
    }
}

struct GregorianView_Previews: PreviewProvider {
    static var previews: some View {
        GregorianView(themeColor: .constant(ThemeColor.bright), displayYear: .constant(2019), displayMonth: .constant(10), offset: .constant(CGSize.zero))
    }
}
