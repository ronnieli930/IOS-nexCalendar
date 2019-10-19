import SwiftUI

struct QuizView: View {
    @Binding var themeColor: ThemeColor
    
    @State var viewState = CGSize.zero
    @State var showQuestion = false
    
    var body: some View {
        ZStack {
            getThemeMainColor(theme: self.themeColor).edgesIgnoringSafeArea(.all)
            QuizCover(viewState: self.$viewState, showQuestion: self.$showQuestion)
                .sheet(isPresented: $showQuestion, content: {
                    QuestionView(themeColor: self.$themeColor, questions: self.getQuestions())
                })
        }
    }
    
    func getQuestions() -> [Question] {
        var questions = questionsData
        questions.shuffle()
        return Array(questions.prefix(5))
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(themeColor: .constant(ThemeColor.bright))
    }
}
