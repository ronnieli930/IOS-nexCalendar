import SwiftUI

struct TutorialListRow: View {
    @State var tutorial: Tutorial
    
    var body: some View {
        HStack {
            Text(tutorial.title)
            Spacer()
            if tutorial.isStarred {
                Image(systemName: "star.circle.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct TutorialListRow_Previews: PreviewProvider {
    static var previews: some View {
        TutorialListRow(tutorial: tutorialsData[0])
    }
}
