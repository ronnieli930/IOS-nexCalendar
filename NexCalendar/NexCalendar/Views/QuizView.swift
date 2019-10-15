//
//  QuizView.swift
//  NexCalendar
//
//  Created by Ronnie Li on 10/10/19.
//  Copyright © 2019 Ronnie Li. All rights reserved.
//

import SwiftUI

struct QuizView: View {
    var body: some View {
        NavigationView {
            Text("Quiz View")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
                .navigationBarTitle("Quiz")
                .navigationBarItems(trailing:
                    HStack {
                        Button("Settings") {
                            print("Settings tapped!")
                        }
                        Image(systemName: "gear")
                            .foregroundColor(Color.blue)
                    }
            )
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
