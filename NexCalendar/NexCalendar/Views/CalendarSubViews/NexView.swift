//
//  NexView.swift
//  NexCalendar
//
//  Created by Ronnie Li on 10/13/19.
//  Copyright © 2019 Ronnie Li. All rights reserved.
//

import SwiftUI

struct NexView: View {
    @State var selectedDay: Date?
    @Binding var displayYear: Int
    @Binding var displayMonth: Int
    @Binding var offset: CGSize
    
    let todayYMD = FormattedDate(date: today)
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
                Text("Nex")
                    .foregroundColor(Color.gray)
                    .padding([.top, .trailing])
            }
            Divider()
            CalendarWeekdays(type: .Nex)
                .padding([.leading, .trailing], 10)
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
                                        isLongSat: self.isLongSat(day: day)
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
            }.padding()
                .frame(minWidth: 0, maxWidth: .infinity)
        }
        .background(
            Rectangle()
                .foregroundColor(Color.black)
                .opacity(isOnchange(offset: offset) ? 0.4 : 0.8))
            .cornerRadius(20)
            .padding(.horizontal, 5)
            .clipped()
            .offset(x: self.offset.width)
            .gesture(DragGesture()
                .onChanged { value in
                    self.offset = value.translation
            }
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
    
    
    
    func handleOnTapped(day d: Date) {
        print(d)
        selectedDay = d
    }
    
    func monthArray() -> [[Date]]{
        let offset = getMonthOffset()
        var month = [[Date]]()
        if isLeapYear(year: displayYear) && displayMonth == 12 {
            var leapDecember = [[Date]]()
            for row in 0 ... 4 {
                var week = [Date]()
                for col in 1 ... 7 {
                    let day = self.getDateAtIndex(index: (row * 7) + col - offset)
                    week.append(day)
                }
                leapDecember.append(week)
            }
            var lastWeek = [Date]()
            for col in 1 ... 7 {
                let day = self.getDateAtIndex(index: 38 - col)
                lastWeek.append(day)
            }
            leapDecember.append(lastWeek)
            return leapDecember
        } else {
            for row in 0 ... 4 {
                var week = [Date]()
                for col in 1 ... 7 {
                    let day = self.getDateAtIndex(index: (row * 7) + col - offset)
                    week.append(day)
                }
                month.append(week)
            }
            return month
        }
    }
    
    func getMonthOffset() -> Int {
        switch displayMonth {
        case 1, 4, 7, 10:
            return 0
        case 2, 8, 11:
            return 3
        case 5:
            return 2
        case 3:
            return 4
        case 6, 9, 12:
            return 5
        default:
            return -1
        }
    }
    
    func getDateAtIndex(index: Int) -> Date {
        var date = DateComponents()
        //First 8 months of 2024 +
        //last 4 months of 2029
        let year = displayMonth <= 8 ? 2024 : 2029
        date.setValue(year, for: .year)
        date.setValue(displayMonth, for: .month)
        date.setValue(index, for: .day)
        let dateAtIndex = calendar.date(from: date)!
        
        return dateAtIndex
    }
    
    func getGregDate(day: Date) -> Date {
        var component = DateComponents()
        var gregDay = calendar.component(.day, from: day)
        if !isLeapYear(year: displayYear) && displayMonth > 2 {
            gregDay += 1
        }
        component.setValue(displayYear, for: .year)
        component.setValue(displayMonth, for: .month)
        component.setValue(gregDay, for: .day)
        return calendar.date(from: component)!
    }
    
    func isInCurrentMonth(day d: Date) -> Bool {
        return displayMonth == calendar.component(.month, from: d)
    }
    
    func isToday(day: Date) -> Bool {
        let ymd = FormattedDate(date: getGregDate(day: day))
        return ymd == todayYMD
    }
    
    func isPast(day: Date) -> Bool {
        let ymd = FormattedDate(date: getGregDate(day: day))
        return ymd < todayYMD
    }
    
    func isLeapYear(year: Int) -> Bool {
        (year % 100 == 0) ? (year % 400 == 0)
            : (year % 4 == 0)
    }
    
    func isLeapDay(day: Date) -> Bool {
        let ymd = FormattedDate(date: day)
        return isLeapYear(year: displayYear) && displayMonth == 12 && ymd.day == 31
    }
    
    func isLongSat(day: Date) -> Bool {
        let ymd = FormattedDate(date: day)
        //Aug 31 && Sep 1 -> long Saturday
        return (ymd.month == 8 && ymd.day == 31) || (ymd.month == 9 && ymd.day == 1)
    }
    
    func isWeekend(day: Date) -> Bool {
        let ymd = FormattedDate(date: day)
        let offset = getMonthOffset()
        return (ymd.day + offset) % 7 == 6 || (ymd.day + offset) % 7 == 0 || isLeapDay(day: day)
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

struct NexView_Previews: PreviewProvider {
    static var previews: some View {
        NexView(displayYear: .constant(2020), displayMonth: .constant(8), offset: .constant(CGSize.zero))
    }
}

