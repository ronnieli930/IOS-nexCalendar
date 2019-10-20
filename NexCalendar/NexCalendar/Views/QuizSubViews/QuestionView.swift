import SwiftUI

struct QuestionView: View {
    @Binding var themeColor: ThemeColor
    
    @State var questions: [Question]
    @State var index = 0
    @State var correctNum = 0
    @State var showAnswers = false
    @State private var showResult = false
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Image("questionBg")
                    .resizable()
                    .frame(height: 300)
                    .border(Color.gray, width: 1)
                    .cornerRadius(14)
                    .shadow(radius: 5)
                Text("\(index+1) / 5")
                    .foregroundColor(Color(hex: 0x484848))
                Divider()
                VStack {
                    Text(questions[index].title)
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .lineLimit(20)
                    Divider()
                    VStack {
                        ForEach(0..<questions[index].options.count, id: \.self) {op in
                            VStack {
                                Button(action: {
                                    self.checkAnswer(question: self.index, userSelect: op)
                                }){
                                    Text(self.questions[self.index].options[op])
                                }
                                Divider()
                            }
                        }
                    }
                }.padding()
                    .background(RoundedRectangle(cornerRadius: 14).foregroundColor(Color.black).opacity(0.1))
                    .padding()
                Spacer()
            }.sheet(isPresented: $showAnswers, content: {
                AnswerView(themeColor: self.$themeColor, questions: self.questions, showAnswers: self.$showAnswers)
            })
                .alert(isPresented: $showResult) {
                    Alert(title: Text(NSLocalizedString("test_result", comment: "")), message: Text(NSLocalizedString("correct", comment: "") +  "\(self.correctNum)"), primaryButton: .destructive(Text(NSLocalizedString("check_answer", comment: ""))){
                        self.index = 0
                        self.correctNum = 0
                        self.showAnswers.toggle()
                        }, secondaryButton: .cancel(Text(NSLocalizedString("redo", comment: "")), action: {
                            self.index = 0
                            self.correctNum = 0
                        }))
                    
            }
        }.background(getThemeMainColor(theme: self.themeColor))
            .edgesIgnoringSafeArea([.top, .bottom])
    }
    
    func goToNextQuestion() {
        if index < 4 {
            index += 1
        } else {
            self.showResult.toggle()
        }
    }
    
    func checkAnswer(question index: Int, userSelect option: Int) {
        let answer = questions[index].answer
        if option == answer {
            self.correctNum += 1
        } else {
            print("wrong!")
        }
        goToNextQuestion()
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(themeColor: .constant(ThemeColor.ocean), questions: questionsData)
    }
}
