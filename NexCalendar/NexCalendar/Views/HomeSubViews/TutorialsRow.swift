import SwiftUI

struct TutorialsRow: View {
    @Binding var themeColor: ThemeColor
    var tutorials: [Tutorial]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 20) {
                    ForEach (self.tutorials){ tut in
                        VStack {
                            TutorialCard(theme: self.themeColor, tutorial: tut)
                        }
                    }
                }
            }
        }
    }
}

struct TutorialsRow_Previews: PreviewProvider {
    static var previews: some View {
        TutorialsRow(themeColor: .constant(ThemeColor.bright), tutorials: tutorialsData)
    }
}
