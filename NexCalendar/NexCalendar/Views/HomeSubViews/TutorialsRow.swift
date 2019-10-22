import SwiftUI

struct TutorialsRow: View {
    @Binding var themeColor: ThemeColor
    @Binding var tutorials: [Tutorial]
    
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 20) {
                    ForEach (0 ..< self.tutorials.count){ index in
                        GeometryReader { geometry in
                            TutorialCard(theme: self.themeColor, tutorials: self.$tutorials, index: index)
                                .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX) / 10), axis: (x: 10, y: -10.0, z: 10))
                        }.frame(width: 130, height: 220)
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
