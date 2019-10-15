//
//  CalendarModePicker.swift
//  NexCalendar
//
//  Created by Ronnie Li on 10/16/19.
//  Copyright © 2019 Ronnie Li. All rights reserved.
//

import SwiftUI

struct CalendarModePicker: View {
    var modes = ["Gregorian", "Nex", "Both"]
    @Binding var displayMode: Int
    
    var body: some View {
        Picker(selection: $displayMode, label: Text("")) {
            ForEach(0 ..< modes.count) { index in
                Text(self.modes[index])
                    .tag(index)
            }
        }.pickerStyle(SegmentedPickerStyle())
    }
}

struct CalendarModePicker_Previews: PreviewProvider {
    static var previews: some View {
        CalendarModePicker(displayMode: .constant(0))
            .previewLayout(.fixed(width: 350, height: 70))
    }
}
