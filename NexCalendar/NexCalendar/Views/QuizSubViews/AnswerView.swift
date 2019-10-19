//
//  AnswerView.swift
//  NexCalendar
//
//  Created by Ronnie Li on 10/19/19.
//  Copyright © 2019 Ronnie Li. All rights reserved.
//

import SwiftUI

struct AnswerView: View {
    @Binding var themeColor: ThemeColor
    
    @State var questions: [Question]
    @Binding var showAnswers: Bool
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Image("answerSheet")
                    .resizable()
                    .frame(height: 300)
                VStack(alignment: .center, spacing: 20) {
                    Text("Answers")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .shadow(radius: 2)
                    Divider()
                    ForEach(questions) {q in
                        VStack {
                            Text(q.title)
                                .font(.body)
                                .foregroundColor(Color(hex: 0x484848))
                                .padding(.bottom)
                            
                            Text(self.answerToString(question: q))
                                .font(.body)
                                .fontWeight(.bold)
                                .underline()
                        }
                        Divider()
                    }
                    Button(action: {
                        self.showAnswers.toggle()
                    }) {
                        Text("Close")
                    }
                }.padding()
                    .background(RoundedRectangle(cornerRadius: 14).foregroundColor(Color.black).opacity(0.1))
                    .padding()
                Spacer()
            }
        }.background(getThemeMainColor(theme: self.themeColor))
            .edgesIgnoringSafeArea([.top, .bottom])
    }
    
    func answerToString(question q: Question) -> String {
        switch q.answer {
        case 0:
            return "A. \(q.options[q.answer])"
        case 1:
            return "B. \(q.options[q.answer])"
        case 2:
            return "C. \(q.options[q.answer])"
        case 3:
            return "D. \(q.options[q.answer])"
        default:
            return "Error"
        }
    }
}

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView(themeColor: .constant(ThemeColor.bright), questions: Array(questionsData.prefix(5)), showAnswers: .constant(true))
    }
}
