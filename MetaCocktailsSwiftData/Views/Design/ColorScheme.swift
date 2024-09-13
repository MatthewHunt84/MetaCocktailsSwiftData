//
//  ColorScheme.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/10/24.
//
import SwiftUI

struct ColorScheme {
    
    static let backgroundDark = Color.black
    static let searchBarBackground = Color(hex: "#3F3F3F")
    static let tintColor = Color(hex: "#FFB803")
    static let darkerTintColor = Color(hex: "#FF8426")
    static let interactionTint = Color(hex: "#00B2FF")
    
    static let selectedColor = Color.white
    static let unwantedColor = Color.white
    
    static let headerColor = tintColor
    
    static let recipeHeaderColor = Color.primary
    
    static let background = Color.black
    static let tabBarTint = tintColor
    
    static let recipeBackground = Color(hex: "#0F0F0F")

    static let recipeBorder = LinearGradient(gradient: Gradient(colors: [tintColor, tintColor, tintColor, darkerTintColor]),
                                           startPoint: .leading,
                                           endPoint: .trailing)
    
    static let recipeBorderFlipped = LinearGradient(gradient: Gradient(colors: [darkerTintColor,tintColor, tintColor, tintColor]),
                                           startPoint: .leading,
                                           endPoint: .trailing)

    static let buttonTint = searchBarBackground //Color(hex: "#436EF8")
    
    
    
    static let backgroundGradient = LinearGradient(colors: [.black, .white.opacity(0.2)], startPoint: .top, endPoint: .bottom)
    
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
