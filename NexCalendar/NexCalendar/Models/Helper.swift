//
//  Helper.swift
//  NexCalendar
//
//  Created by Ronnie Li on 10/19/19.
//  Copyright © 2019 Ronnie Li. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
}

enum ThemeColor {
    case bright
    case ocean
    case forest
    case dark
}

func getThemeMainColor(theme t: ThemeColor) -> Color {
    switch t {
    case .bright:
        return Color.yellow
    case .ocean:
        return Color(hex: 0x3688da)
    case .forest:
        return Color.green
    case .dark:
        return Color(hex: 0x484848)
    }
}
