//
//  FontFactory.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/27/24.
//

import SwiftUI

struct FontFactory {
    
    static func regularText(_ text: String, font: String = "AvenirNext-Regular", size: CGFloat, color: Color = .primary, isBold: Bool = false) -> Text {
        return Text(text)
            .font(.custom(font, size: size))
            .foregroundStyle(color)
            .bold(isBold)
    }
    
    static func mediumText(_ text: String, font: String = "AvenirNext-Medium", size: CGFloat, color: Color = .primary, isBold: Bool = false) -> Text {
        return Text(text)
            .font(.custom(font, size: size))
            .foregroundStyle(color)
            .bold(isBold)
    }
    
    static func historicText(_ text: String, font: String = "Avenir-BookOblique", size: CGFloat, color: Color = .primary, isBold: Bool = false) -> Text {
        return Text(text)
            .font(.custom(font, size: size))
            .foregroundStyle(Color.secondary)
            .bold(isBold)
    }
    
    static func regularFont(size: CGFloat) -> Font {
        Font.custom("AvenirNext-Regular", size: size)
    }
    
    static func alphabetFont(for frameHeight: CGFloat, isSelected: Bool) -> Font {
        switch frameHeight {
        case 0..<400:
            isSelected ? mediumFont(size: 14) : regularFont(size: 14)
        case 400..<500:
            isSelected ? mediumFont(size: 16) : regularFont(size: 16)
        case 500..<600:
            isSelected ? mediumFont(size: 18) : regularFont(size: 18)
        case 600..<700:
            isSelected ? mediumFont(size: 20) : regularFont(size: 20)
        default:
            isSelected ? mediumFont(size: 22) : regularFont(size: 22)
        }
    }
    
    static func mediumFont(size: CGFloat) -> Font {
        Font.custom("AvenirNext-Medium", size: size)
    }
    
    static func italicMediumFont(size: CGFloat) -> Font {
        Font.custom("AvenirNext-MediumItalic", size: size)
    }
    
    static func italicFont(size: CGFloat) -> Font {
        Font.custom("AvenirNext-Italic", size: size)
    }
    
    static func listLetter(size: CGFloat) -> Font {
        Font.custom("AvenirNext-Medium", size: size)
    }
    
    static func titleHeader22(title: String) -> Text {
        return Text(title)
            .font(.custom("AvenirNext-DemiBold", size: 22))
            .foregroundStyle(ColorScheme.headerColor)
//            .foregroundStyle(LinearGradient(colors: [Color.brandPrimaryOrange, ColorScheme.tintColor], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    
    static func titleHeader24(title: String) -> Text {
        return Text(title)
            .font(.custom("AvenirNext-DemiBold", size: 24))
            .foregroundStyle(ColorScheme.headerColor)
    }
    
    static func aboutHeader(title: String) -> Text {
        return Text(title)
            .font(.custom("AvenirNext-DemiBold", size: 26))
            .foregroundStyle(ColorScheme.tintColor)
//            .foregroundStyle(LinearGradient(colors: [Color.brandPrimaryOrange, ColorScheme.tintColor, Color.brandPrimaryOrange], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    
    static func devHeader(title: String) -> Text {
        return Text(title)
            .font(.custom("AvenirNext-DemiBold", size: 18))
            .foregroundStyle(LinearGradient(colors: [Color.brandPrimaryOrange, ColorScheme.tintColor, Color.brandPrimaryOrange], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    
    static var buildBodySmall10: Font = .custom("AvenirNext-Regular", size: 10)
    static var buildStepSmall10B: Font = .custom("AvenirNext-Regular", size: 10).bold()
    static var sectionHeader12: Font = .custom("AvenirNext-Regular", size: 12)
    static var ingredientInfoFootnote13: Font = .custom("AvenirNext-Italic", size: 14)
    static var fontBody14: Font = .custom("AvenirNext-Regular", size: 14)
    static var fontBody16: Font = .custom("AvenirNext-Regular", size: 16)
    static var specMeasurement16B: Font = .custom("AvenirNext-Regular", size: 16).bold()
    static var recipeCardHeader18B: Font = .custom("AvenirNext-Regular", size: 18).bold()
    static var formLabel18: Font = .custom("AvenirNext-Regular", size: 18)
    static var bottomToolbarButton20: Font = .custom("AvenirNext-Regular", size: 20)
    
    static func recipeHeader(title: String, isHistoric: Bool = false) -> Text {
        if title.contains("(W&G Version)") {
            return Text(title.replacingOccurrences(of: wAndGTitleTag, with: ""))
                .font(.custom("AvenirNext-Regular", size: 24))
                .foregroundStyle(.primary)
        } else if title.contains("(Death & Co Version)") {
            return Text(title.replacingOccurrences(of: (" (Death & Co Version)"), with: ""))
                .font(.custom("AvenirNext-Regular", size: 24))
                .foregroundStyle(.primary)
        } else if title.contains("(M&H Version)") {
            return Text(title.replacingOccurrences(of: mAndHVersionTag, with: ""))
                .font(.custom("AvenirNext-Regular", size: 24))
                .foregroundStyle(.primary)
        } else {
            return Text(title.replacingOccurrences(of: historicTag, with: ""))
                .font(.custom("AvenirNext-Regular", size: 24))
                .foregroundStyle(.primary)
        }
    }
    
}
