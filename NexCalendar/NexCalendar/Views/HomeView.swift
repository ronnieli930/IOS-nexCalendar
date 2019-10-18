import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
//                Image("background")
//                    .resizable()
//                    .edgesIgnoringSafeArea(.all)
                Color.yellow.edgesIgnoringSafeArea(.all)
                ScrollView(.vertical) {
                    VStack {
                        NavigationLink(destination: TutorialList()){
                            CourseListNavButton()
                        }.padding(.top)
                        TutorialsRow(tutorials: tutorialsData)
                        Spacer()
                    }
                }
                .navigationBarTitle(Text("Home"))
                .navigationBarItems(leading: Text("6 tutorials").foregroundColor(Color.gray), trailing: Button(action: {print("open settings")}) {
                    Image(systemName: "wrench.fill")
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
