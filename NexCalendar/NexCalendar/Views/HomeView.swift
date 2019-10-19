import SwiftUI

struct HomeView: View {
    @Binding var themeColor: ThemeColor
    @State var showSetting: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                //                Image("background")
                //                    .resizable()
                //                    .edgesIgnoringSafeArea(.all)
                getThemeMainColor(theme: self.themeColor).edgesIgnoringSafeArea(.all)
                ScrollView(.vertical) {
                    VStack {
                        NavigationLink(destination: TutorialList(theme: self.themeColor)){
                            CourseListNavButton(themeColor: self.$themeColor)
                        }.padding(.top)
                        TutorialsRow(themeColor: self.$themeColor, tutorials: tutorialsData)
                        Spacer()
                    }
                }
                .navigationBarTitle(Text("Home"))
                .navigationBarItems(leading: Text("6 tutorials").foregroundColor(Color.gray), trailing: Button(action: {
                    self.showSetting.toggle()
                }) {
                    Image(systemName: "wrench.fill")
                })
            }
        }.actionSheet(isPresented: self.$showSetting) {
            ActionSheet(title: Text("Change Theme"), buttons: [.default(Text("Bright"), action: {self.themeColor = ThemeColor.bright}),
                                                               .default(Text("Ocean"), action: {self.themeColor = ThemeColor.ocean}),
                                                               .default(Text("Forest"), action: {self.themeColor = ThemeColor.forest}),
                                                               .default(Text("Dark"), action: {self.themeColor = ThemeColor.dark}),
                                                               .cancel()])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(themeColor: .constant(ThemeColor.dark))
    }
}
