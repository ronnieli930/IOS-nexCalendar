import SwiftUI

struct TutorialDetail: View {
    var theme: ThemeColor
    @Binding var tutorials: [Tutorial]
    var index: Int
    
    var body: some View {
        VStack {
            Image("tutorial1")
                .resizable()
                .frame(height: 300)
                .cornerRadius(14)
                .shadow(radius: 5)
            ScrollView(.vertical) {
                VStack {
                    Text(tutorials[index].title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Text(tutorials[index].content)
                        .foregroundColor(Color.white)
                        .padding(.top, 20)
                    }.padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.white.opacity(0.2), Color.white.opacity(0.1), .clear]), startPoint: .top, endPoint: .bottom))
            }.padding()
            Spacer()
        }.background(getThemeMainColor(theme: theme))
        .navigationBarItems(trailing: Button(action: {
            self.tutorials[self.index].isStarred.toggle()
            markStar(tutorialIndex: self.index)
        }){
            HStack {
                Image(systemName: tutorials[index].isStarred ? "star.fill" : "star")
                Text(tutorials[index].isStarred ? "Unstar" : "Star")
            }
        })
            .edgesIgnoringSafeArea(.top)
    }
}

struct TutorialDetail_Previews: PreviewProvider {
    static var previews: some View {
        TutorialDetail(theme: ThemeColor.tropical, tutorials: .constant(tutorialsData), index: 2)
    }
}
