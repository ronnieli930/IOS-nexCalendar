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
    case tropical
    case ocean
    case forest
    case dark
}

func getThemeMainColor(theme t: ThemeColor) -> Color {
    switch t {
    case .tropical:
        return Color.yellow
    case .ocean:
        return Color(hex: 0x65e5ff)
    case .forest:
        return Color.green
    case .dark:
        return Color(hex: 0x888888)
    }
}
