import SwiftUI

struct CourseListNavButton: View {
    var body: some View {
        VStack {
            Text("Explore \nNexCalendar")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
                .padding([.top, .leading, .trailing])
                .frame(height: 100)
                .shadow(radius: 15)
            Image("courseInfo3")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 230)
                .cornerRadius(14)
        }.background(
            Rectangle()
//                .foregroundColor(Color.init(red: 55/255, green: 46/255, blue: 118/255))
                .foregroundColor(Color.purple)
                .cornerRadius(14)
                .shadow(radius: 5))
    }
}

struct CourseListNavButton_Previews: PreviewProvider {
    static var previews: some View {
        CourseListNavButton()
    }
}
