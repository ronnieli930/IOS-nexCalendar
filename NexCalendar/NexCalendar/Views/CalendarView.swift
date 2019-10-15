//
//  CalendarView.swift
//  NexCalendar
//
//  Created by Ronnie Li on 10/10/19.
//  Copyright © 2019 Ronnie Li. All rights reserved.
//

import SwiftUI

struct CalendarView: View {
    @State var displayMode: Int = 1
    @State var showDatePicker: Bool = false
    
    @State var gregYear = calendar.component(.year, from: today)
    @State var gregMonth = calendar.component(.month, from: today)
    @State private var gregOffset = CGSize.zero
    
    @State var nexYear = calendar.component(.year, from: today)
    @State var nexMonth = calendar.component(.month, from: today)
    @State private var nexOffset = CGSize.zero
    
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                CalendarModePicker(displayMode: self.$displayMode)
                if displayMode == 0 {
                    //Gregorian Mode
                    Spacer()
                    GregorianView(displayYear: $gregYear, displayMonth: $gregMonth, offset: $gregOffset)
                    Spacer()
                    Spacer()
                }else if displayMode == 1 {
//                    // Nex Mode
                    Spacer()
                    NexView(displayYear: $nexYear, displayMonth: $nexMonth, offset: $nexOffset)
                    Spacer()
                    Spacer()
                } else if displayMode == 2{
                    ScrollView(.vertical, showsIndicators: true) {
                        GregorianView(displayYear: $gregYear, displayMonth: $gregMonth, offset: $gregOffset)
                        Divider()
                        NexView(displayYear: $nexYear, displayMonth: $nexMonth, offset: $nexOffset)
                    }
                    
                }
            }
            .navigationBarTitle(Text("Calendar"), displayMode: .large)
            .navigationBarItems(trailing: Button(action: {self.showDatePicker.toggle()}) {HStack {
                Image(systemName: "keyboard.chevron.compact.down")
                Text("Date")
                }})
        }.sheet(isPresented: $showDatePicker, content: {ModalDatePicker(showModal: self.$showDatePicker, gregYear: self.$gregYear, gregMonth: self.$gregMonth, nexYear: self.$nexYear, nexMonth: self.$nexMonth)})
    }
    
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CalendarView().previewDisplayName("combined")
            //            GregorianView(displayYear: .constant(2020), displayMonth: .constant(2)).previewDisplayName("Gregorian")
            //            NexView(displayYear: .constant(2019), displayMonth: .constant(10)).previewDisplayName("NexCalendar")
        }
    }
}
