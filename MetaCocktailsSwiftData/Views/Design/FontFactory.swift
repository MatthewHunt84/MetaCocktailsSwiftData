//
//  FontFactory.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/27/24.
//

import SwiftUI

struct FontFactory {
    
    static func regularText(_ text: String, font: String = "AvenirNext-Regular", size: CGFloat, color: Color = .white, isBold: Bool = false) -> Text {
        return Text(text)
            .font(.custom(font, size: size))
            .foregroundStyle(color)
            .bold(isBold)
    }
    
    static func regularFont(size: CGFloat) -> Font {
        Font.custom("AvenirNext-Regular", size: size)
    }
    
    static func titleHeader30(title: String) -> Text {
        return Text(title)
            .font(.custom("AvenirNext-Medium", size: 30))
            .foregroundStyle(ColorScheme.headerColor)
    }
    
    static var buildBodySmall10: Font = .custom("AvenirNext-Regular", size: 10)
    static var buildStepSmall10B: Font = .custom("AvenirNext-Regular", size: 10).bold()
    static var sectionHeader12: Font = .custom("AvenirNext-Regular", size: 12)
    static var specMeasurement16B: Font = .custom("AvenirNext-Regular", size: 16).bold()
    static var fontBody16: Font = .custom("AvenirNext-Regular", size: 16)
    static var recipeCardHeader18B: Font = .custom("AvenirNext-Regular", size: 18).bold()
    static var formLabel18: Font = .custom("AvenirNext-Regular", size: 18)
    static var bottomToolbarButton20: Font = .custom("AvenirNext-Regular", size: 20)
    
    static func recipeHeader(title: String) -> Text {
        return Text(title.replacingOccurrences(of: (" (W&G Version)"), with: ""))
            .font(.custom("AvenirNext-Regular", size: 24))
            .foregroundStyle(ColorScheme.recipeHeaderColor)
    }
    
}
