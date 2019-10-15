//
//  ContentView.swift
//  NexCalendar
//
//  Created by Ronnie Li on 10/10/19.
//  Copyright © 2019 Ronnie Li. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("tutorials")
                BadgeRow(categoryName: "Badges", badges: badgeData)

                    
            }.navigationBarTitle(Text("abc"))
        }
        .edgesIgnoringSafeArea([.leading, .trailing, .bottom])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
