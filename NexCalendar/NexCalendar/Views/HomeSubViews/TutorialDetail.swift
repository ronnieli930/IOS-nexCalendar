import SwiftUI

struct TutorialDetail: View {
    @State var tutorial: Tutorial
    
    var body: some View {
        VStack {
            Text(tutorial.content)
            
        }
    }
}

struct TutorialDetail_Previews: PreviewProvider {
    static var previews: some View {
        TutorialDetail(tutorial: tutorialsData[4])
    }
}
