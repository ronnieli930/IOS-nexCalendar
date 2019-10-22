import SwiftUI

struct ModalDatePicker: View {
    @State var selectedDate = Date()
    
    @Binding var showModal: Bool
    @Binding var gregYear: Int
    @Binding var gregMonth: Int
    @Binding var nexYear: Int
    @Binding var nexMonth: Int
    
    var body: some View {
        ZStack {
            Color.gray.edgesIgnoringSafeArea(.all)
            VStack {
                Text(NSLocalizedString("select_date", comment: ""))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                DatePicker(selection: $selectedDate, displayedComponents: .date) {
                    Text("")
                }
                .colorInvert()
                .labelsHidden()
                Button(action: {
                    self.updateCalendar()
                }) {
                    Text(NSLocalizedString("update",comment: ""))
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .background(Rectangle()
                            .frame(width: 70, height: 40)
                            .cornerRadius(12))
                }
            }
        }
    }
    
    func updateCalendar() {
        withAnimation(.spring()){
            let year = calendar.component(.year, from: selectedDate)
            let month = calendar.component(.month, from: selectedDate)
            
            self.gregYear = year
            self.gregMonth = month
            
            self.nexYear = year
            self.nexMonth = month
            
            self.showModal = false
        }
    }
}

struct ModalDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        ModalDatePicker(showModal: .constant(true), gregYear: .constant(2019), gregMonth: .constant(2), nexYear: .constant(2019), nexMonth: .constant(2))
    }
}
