import SwiftUI

struct TutorialCard: View {
    var theme: ThemeColor
    var tutorial: Tutorial
    
    var body: some View {
        NavigationLink(destination: TutorialDetail(theme: theme, tutorial: tutorial)) {
            ZStack {
                LinearGradient(gradient: .init(colors: self.getGradientColors(theme: self.theme)), startPoint: .bottomLeading, endPoint: .topTrailing)
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
    
    func getGradientColors(theme t: ThemeColor) -> [Color] {
        switch t {
        case .bright:
            return [Color.pink,Color.red, Color.orange, Color.yellow]
        case .ocean:
            return [Color.init(red: 60/255, green: 1/255, blue: 240/255), Color.init(red: 2/255, green: 100/255, blue: 223/255), Color.init(red: 1/255, green: 230/255, blue: 223/255)]
        case .forest:
            return [Color(hex: 0x16e0a0), Color.green, Color(hex: 0xfbfdb1)]
        case .dark:
            return [Color(hex: 0x222222),Color(hex: 0x777777) ,Color(hex: 0xbbbbbb)]
        }
    }
}


struct TutorialCard_Previews: PreviewProvider {
    static var previews: some View {
        TutorialCard(theme: ThemeColor.forest, tutorial: tutorialsData[0])
    }
}
