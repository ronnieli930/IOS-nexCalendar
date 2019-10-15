//
//  BadgeRow.swift
//  NexCalendar
//
//  Created by Ronnie Li on 10/10/19.
//  Copyright © 2019 Ronnie Li. All rights reserved.
//

import SwiftUI

struct BadgeRow: View {
    var categoryName:String
    var badges:[Badge]
    
    var body: some View {
        VStack {
            Text(categoryName)
                .multilineTextAlignment(.leading)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 20) {
                    ForEach (self.badges){ badge in
                        GeometryReader { geometry in
                            BadgeItem(badge: badge)
                                .frame(width: 120)
                                .padding(.trailing, 30)
                                .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 100) / -10), axis: (x: 0, y: 10.0, z: 0))
                        }.frame(width: 130, height: 220)
                        
                    }
                }
            }
        }
    }
}

struct BadgeRow_Previews: PreviewProvider {
    static var previews: some View {
        BadgeRow(categoryName: "Badges", badges: badgeData)
    }
}

