//
//  QuizCover.swift
//  NexCalendar
//
//  Created by Ronnie Li on 10/19/19.
//  Copyright © 2019 Ronnie Li. All rights reserved.
//

import SwiftUI

struct QuizCover: View {
    @Binding var viewState: CGSize
    @Binding var showQuestion: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image("quizCover")
                .resizable()
                .frame(width: 400, height: 400)
                .shadow(radius: 5)
            Text("<<<   Swipe To Continue >>>")
                .font(.system(size: 18))
                .fontWeight(.heavy)
                .foregroundColor(Color.white)
                .shadow(radius: 2)
                .padding([.top, .leading], 30)
            Text("Are you Ready?")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color(hex: 0x484848))
                .padding(.leading, 30)
                .padding(.top, 5)
            Text("How much do you know about the NexCalendar? Here are some Multiple questions for you :-)")
                .font(.system(size: 20))
                .fontWeight(.medium)
                .foregroundColor(Color(hex: 0x484848))
                .padding(.horizontal, 30)
                .padding(.top, 10)
            Spacer()
        }.navigationBarTitle("Quiz")
            .animation(.easeInOut)
            .border(Color.gray, width: 1)
            .blur(radius: self.viewState.width > 130 || self.viewState.width < -130 ? 7 : 0 )
            .edgesIgnoringSafeArea(.top)
            .offset(x: viewState.width)
            .gesture(DragGesture()
                .onChanged { value in
                    self.viewState = value.translation
            }
            .onEnded { value in
                if self.viewState.width > 200 || self.viewState.width < -200 {
                    self.showQuestion.toggle()
                }
                self.viewState = .zero
            })
    }
}

struct QuizCover_Previews: PreviewProvider {
    static var previews: some View {
        QuizCover(viewState: .constant(CGSize.zero), showQuestion: .constant(false))
    }
}
