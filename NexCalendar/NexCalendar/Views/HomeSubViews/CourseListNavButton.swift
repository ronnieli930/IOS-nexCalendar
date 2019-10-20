import SwiftUI

struct CourseListNavButton: View {
    @Binding var themeColor: ThemeColor
    var body: some View {
        VStack {
            Text(NSLocalizedString("explore_nexcalendar", comment: ""))
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
                .padding([.top, .leading, .trailing])
                .frame(height: 100)
            Image("courseInfo3")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 230)
                .cornerRadius(14)
        }.background(
            Rectangle()
//                .foregroundColor(Color.init(red: 55/255, green: 46/255, blue: 118/255))
                .foregroundColor(self.getCourseListNavButtonThemeColor(theme: self.themeColor))
                .cornerRadius(14)
                .shadow(radius: 5))
    }
    
    func getCourseListNavButtonThemeColor(theme t: ThemeColor) -> Color {
        switch t {
        case .tropical:
            return Color(hex: 0xfd7c2f)
        case .ocean:
            return Color(hex: 0x0044b2)
        case .forest:
            return Color(hex: 0x85e085)
        case .dark:
            return Color(hex: 0x9b9c9c)
        }
    }
}

struct CourseListNavButton_Previews: PreviewProvider {
    static var previews: some View {
        CourseListNavButton(themeColor: .constant(ThemeColor.tropical))
    }
}
