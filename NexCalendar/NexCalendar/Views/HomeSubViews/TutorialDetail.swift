import SwiftUI

struct TutorialDetail: View {
    var theme: ThemeColor
    @State var tutorial: Tutorial
    
    var body: some View {
        VStack {
            Image("tutorial1")
                .resizable()
                .frame(height: 300)
                .cornerRadius(14)
                .shadow(radius: 5)
            ScrollView(.vertical) {
                VStack {
                    Text(tutorial.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Text(tutorial.content)
                        .foregroundColor(Color.white)
                        .padding(.top, 20)
                    }.padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.white.opacity(0.2), Color.white.opacity(0.1), .clear]), startPoint: .top, endPoint: .bottom))
            }.padding()
            Spacer()
        }.background(getThemeMainColor(theme: theme))
            .edgesIgnoringSafeArea(.top)
    }
}

struct TutorialDetail_Previews: PreviewProvider {
    static var previews: some View {
        TutorialDetail(theme: ThemeColor.bright, tutorial: tutorialsData[4])
    }
}
