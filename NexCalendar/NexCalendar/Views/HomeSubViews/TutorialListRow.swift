import SwiftUI

struct TutorialListRow: View {
    @Binding var tutorials: [Tutorial]
    var index: Int
    
    var body: some View {
        HStack {
            Text(tutorials[index].title)
            Spacer()
            if tutorials[index].isStarred {
                Image(systemName: "star.circle.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct TutorialListRow_Previews: PreviewProvider {
    static var previews: some View {
        TutorialListRow(tutorials: .constant(tutorialsData), index: 0)
    }
}
