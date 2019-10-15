//
//  AppView.swift
//  NexCalendar
//
//  Created by Ronnie Li on 10/10/19.
//  Copyright © 2019 Ronnie Li. All rights reserved.
//

import SwiftUI

struct AppView: View {
    @State private var selection = 1
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.black
    }
    var body: some View {
        TabView (selection: $selection) {
            QuizView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("quiz")
            }.tag(0)
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("home")
            }.tag(1)
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("calendar")
            }.tag(2)
        }
        .font(.headline)
//        .edgesIgnoringSafeArea(.top)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
