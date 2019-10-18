import SwiftUI

struct TutorialCard: View {
    var tutorial: Tutorial
    var colors: [Color]
    
    var body: some View {
        NavigationLink(destination: TutorialDetail(tutorial: tutorial)) {
            ZStack {
                LinearGradient(gradient: .init(colors: colors), startPoint: .bottomLeading, endPoint: .topTrailing)
                VStack {
                    Text("\(tutorial.id).")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(Color.white)
                        .padding(.top, 10)
                    Spacer()
                    Text(tutorial.title)
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding()
                    Spacer()
                }
                Spacer()
            }.frame(width: 140, height: 180)
                .cornerRadius(20)
                .padding()
                .shadow(radius: 5)
        }
    }
}


struct TutorialCard_Previews: PreviewProvider {
    static var previews: some View {
        TutorialCard(tutorial: tutorialsData[0], colors: [Color.init(red: 60/255, green: 1/255, blue: 240/255), Color.init(red: 2/255, green: 100/255, blue: 223/255), Color.init(red: 1/255, green: 230/255, blue: 223/255)])
    }
}
