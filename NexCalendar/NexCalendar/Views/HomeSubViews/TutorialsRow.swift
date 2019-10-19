import SwiftUI

struct TutorialsRow: View {
    @Binding var themeColor: ThemeColor
    @Binding var tutorials: [Tutorial]
    
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 20) {
                    ForEach (0 ..< self.tutorials.count){ index in
                        VStack {
                            TutorialCard(theme: self.themeColor, tutorials: self.$tutorials, index: index)
                        }
                    }
                }
            }
        }
    }
}

struct TutorialsRow_Previews: PreviewProvider {
    static var previews: some View {
        TutorialsRow(themeColor: .constant(ThemeColor.tropical), tutorials: .constant(tutorialsData))
    }
}
