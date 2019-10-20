import SwiftUI

struct AppView: View {
    @State private var selection = 1
    @State var themeColor = ThemeColor.tropical
    
    var body: some View {
        TabView (selection: $selection) {
            QuizView(themeColor: self.$themeColor)
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text(NSLocalizedString("quiz", comment: ""))
            }.tag(0)
            HomeView(themeColor: self.$themeColor)
                .tabItem {
                    Image(systemName: "house")
                    Text(NSLocalizedString("home", comment: ""))
            }.tag(1)
            CalendarView(themeColor: self.$themeColor)
                .tabItem {
                    Image(systemName: "calendar")
                    Text(NSLocalizedString("calendar", comment: ""))
                    
            }.tag(2)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
