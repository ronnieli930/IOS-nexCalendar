import SwiftUI

struct AppView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView (selection: $selection) {
            QuizView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Quiz")
            }.tag(0)
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
            }.tag(1)
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                    
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
