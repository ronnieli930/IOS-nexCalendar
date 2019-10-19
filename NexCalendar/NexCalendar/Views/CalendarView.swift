import SwiftUI

struct CalendarView: View {
    @Binding var themeColor: ThemeColor
    
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
            ZStack {
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
                    CalendarModePicker(displayMode: self.$displayMode)
                        .padding(.horizontal)
                    if displayMode == 0 {
                        //Gregorian Mode
                        Spacer()
                        GregorianView(themeColor: $themeColor, displayYear: $gregYear, displayMonth: $gregMonth, offset: $gregOffset)
                        Spacer()
                        Spacer()
                    }else if displayMode == 1 {
                        //                    // Nex Mode
                        Spacer()
                        NexView(themeColor: $themeColor, displayYear: $nexYear, displayMonth: $nexMonth, offset: $nexOffset)
                        Spacer()
                        Spacer()
                    } else if displayMode == 2{
                        ScrollView(.vertical, showsIndicators: true) {
                            GregorianView(themeColor: $themeColor, displayYear: $gregYear, displayMonth: $gregMonth, offset: $gregOffset)
                            Divider()
                            NexView(themeColor: $themeColor, displayYear: $nexYear, displayMonth: $nexMonth, offset: $nexOffset)
                        }
                        
                    }
                }
                .navigationBarTitle(Text("Calendar"), displayMode: .large)
                .navigationBarItems(trailing: Button(action: {self.showDatePicker.toggle()}) {HStack {
                    Image(systemName: "keyboard.chevron.compact.down")
                    Text("Date")
                    }})
            }
        }.sheet(isPresented: $showDatePicker, content: {ModalDatePicker(showModal: self.$showDatePicker, gregYear: self.$gregYear, gregMonth: self.$gregMonth, nexYear: self.$nexYear, nexMonth: self.$nexMonth)})
    }
    
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CalendarView(themeColor: .constant(ThemeColor.dark)).previewDisplayName("combined")
            //            GregorianView(displayYear: .constant(2020), displayMonth: .constant(2)).previewDisplayName("Gregorian")
            //            NexView(displayYear: .constant(2019), displayMonth: .constant(10)).previewDisplayName("NexCalendar")
        }
    }
}
