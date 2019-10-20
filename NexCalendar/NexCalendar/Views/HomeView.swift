import SwiftUI

struct HomeView: View {
    @Binding var themeColor: ThemeColor
    @State var showSetting: Bool = false
    @State var tutorials = tutorialsData
    var body: some View {
        NavigationView {
            ZStack {
                getThemeMainColor(theme: self.themeColor).edgesIgnoringSafeArea(.all)
                ScrollView(.vertical) {
                    VStack {
                        NavigationLink(destination: TutorialList(tutorials: self.$tutorials, theme: self.themeColor)){
                            CourseListNavButton(themeColor: self.$themeColor)
                        }.padding(.top)
                        TutorialsRow(themeColor: self.$themeColor, tutorials: self.$tutorials)
                        Spacer()
                    }
                }
                .navigationBarTitle(Text(NSLocalizedString("home", comment: "")))
                .navigationBarItems(leading: Text(NSLocalizedString("6tutorials", comment: "")).foregroundColor(Color.gray), trailing: Button(action: {
                    self.showSetting.toggle()
                }) {
                    Image(systemName: "wrench.fill")
                })
            }
        }.actionSheet(isPresented: self.$showSetting) {
            ActionSheet(title: Text(NSLocalizedString("change_theme", comment: "")), buttons: [.default(Text(NSLocalizedString("tropical", comment: "")), action: {self.themeColor = ThemeColor.tropical}),
                                                               .default(Text(NSLocalizedString("ocean", comment: "")), action: {self.themeColor = ThemeColor.ocean}),
                                                               .default(Text(NSLocalizedString("forest", comment: "")), action: {self.themeColor = ThemeColor.forest}),
                                                               .default(Text(NSLocalizedString("dark", comment: "")), action: {self.themeColor = ThemeColor.dark}),
                                                               .cancel()])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(themeColor: .constant(ThemeColor.dark))
    }
}
