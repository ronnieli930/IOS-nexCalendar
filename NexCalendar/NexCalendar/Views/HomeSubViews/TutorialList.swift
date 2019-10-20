import SwiftUI

struct TutorialList: View {
    @Binding var tutorials: [Tutorial]
    @State var theme: ThemeColor
    @State var showStarred = false
    
    var body: some View {
        List {
            Toggle(isOn: self.$showStarred){
                Text(NSLocalizedString("starred_tutorials", comment: ""))
                    .bold()
            }
            ForEach(0..<self.tutorials.count) { index in
                if !self.showStarred || self.tutorials[index].isStarred {
                    NavigationLink(destination: TutorialDetail(theme: self.theme, tutorials: self.$tutorials, index: index)) {
                        TutorialListRow(tutorials: self.$tutorials, index: index)
                    }
                }
            }
            
        }
        .animation(.easeInOut)
        .navigationBarTitle(Text(NSLocalizedString("tutorial_list", comment: "")))
    }
}

struct TutorialList_Previews: PreviewProvider {
    static var previews: some View {
        TutorialList(tutorials: .constant(tutorialsData), theme: ThemeColor.tropical)
    }
}
