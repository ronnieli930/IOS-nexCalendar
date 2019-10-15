//
//  BadgeItem.swift
//  NexCalendar
//
//  Created by Ronnie Li on 10/10/19.
//  Copyright © 2019 Ronnie Li. All rights reserved.
//

import SwiftUI

struct BadgeItem: View {
    var badge:Badge
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Image(badge.imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(30)
                .shadow(radius: 20)
                .frame(width: 100, height: 100)
            VStack(alignment: .center, spacing: 5) {
                Text(badge.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.orange)
                Text(badge.description)
                    .font(.footnote)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .foregroundColor(Color.green)
                    .frame(width: 100, height: 40)
            }
        }.frame(width: 300, height: 300)
    }
}

struct BadgeItem_Previews: PreviewProvider {
    static var previews: some View {
        BadgeItem(badge: badgeData[0])
    }
}
