import SwiftUI

struct TutorialList: View {
    @State var theme: ThemeColor
    @State var showStarred = false
    
    var body: some View {
        List {
            Toggle(isOn: self.$showStarred){
                Text("Starred Tutorials")
                    .bold()
            }
            ForEach(tutorialsData) { tut in
                if !self.showStarred || tut.isStarred {
                    NavigationLink(destination: TutorialDetail(theme: self.theme,tutorial: tut)) {
                        TutorialListRow(tutorial: tut)
                    }
                }
            }
            
        }
        .animation(.easeInOut)
        .navigationBarTitle(Text("Tutorial List"))
    }
}

struct TutorialList_Previews: PreviewProvider {
    static var previews: some View {
        TutorialList(theme: ThemeColor.bright)
    }
}
