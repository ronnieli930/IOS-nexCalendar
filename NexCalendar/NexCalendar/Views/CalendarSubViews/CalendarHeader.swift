//
//  CalendarHeader.swift
//  NexCalendar
//
//  Created by Ronnie Li on 10/10/19.
//  Copyright © 2019 Ronnie Li. All rights reserved.
//

import SwiftUI

struct CalendarHeader: View {
    let calendar : Calendar
    
    var body: some View {
        VStack {
            Text("Normal Calendar")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(Color.yellow)
                .shadow(radius: 50)
        }.padding()
    }
}

struct CalendarHeader_Previews: PreviewProvider {
    static var previews: some View {
        CalendarHeader(calendar: calendar)
    }
}
