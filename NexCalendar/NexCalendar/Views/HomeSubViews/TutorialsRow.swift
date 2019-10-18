import SwiftUI

struct TutorialsRow: View {
    var tutorials: [Tutorial]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 20) {
                    ForEach (self.tutorials){ tut in
                        VStack {
                            TutorialCard(tutorial: tut, colors:[Color.init(red: 60/255, green: 1/255, blue: 240/255), Color.init(red: 2/255, green: 100/255, blue: 223/255), Color.init(red: 1/255, green: 230/255, blue: 223/255)])
                        }
                    }
                }
            }
        }
    }
}

struct TutorialsRow_Previews: PreviewProvider {
    static var previews: some View {
        TutorialsRow(tutorials: tutorialsData)
    }
}
