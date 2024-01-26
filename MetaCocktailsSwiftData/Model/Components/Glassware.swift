//
//  Glassware.swift
//  MetaCocktails
//
//  Created by Matthew Hunt on 8/30/23.
//

import Foundation
import SwiftUI

enum Glassware: String, Codable {
    case blueBlazerMugs      = "Blue Blazer Mugs"
    case cinnamonSugarRim    = "Cinnamon Sugar Rimmed Cocktail Glass"
    case coupe               = "Coupe"
    case collins             = "Collins"
    case crustaGlass         = "Crusta Glass (See build order)"
    case doubleOld           = "Double Old Fashioned"
    case wineGlass           = "Large Wine Glass"
    case martini             = "Martini"
    case flute               = "Flute"
    case snifter             = "Snifter (Flip Glass)"
    case fizzGlass           = "Chilled 8 oz. Fizz Glass"
    case stemmedGlassware    = "Stemmed"
    case sugarRimStemmed     = "Stemmed with a sugar rim"
    case nickAndNora         = "Nick and Nora"
    case doubleOldSalt       = "Double Old Fashioned (half salt rim)"
    case doubleOldCelerySalt = "Double Old Fashioned (half celery salt rim)"
    case julep               = "Julep Cup or Highball"
    case singleOld           = "Frozen Single Old Fashioned"
    case tikiMug             = "Tiki Mug"
    case toddyGlass          = "Toddy Glass"
   
    func Image(cocktail: Cocktail) -> Image {
        switch self {
        case .blueBlazerMugs:
            return  SwiftUI.Image("Urkel")
        case .cinnamonSugarRim:
            return  SwiftUI.Image("martiniBlack2")
        case .coupe:
            return  SwiftUI.Image("coupeBlack2")
        case .collins:
            return   SwiftUI.Image("collinsBlack")
        case .crustaGlass:
            return   SwiftUI.Image("brandy crusta")
        case .doubleOld:
            if let ice = cocktail.ice  {
                if ice == .bigRock {
                    return SwiftUI.Image("doubleOldBFGBlack")
                } else {
                    return SwiftUI.Image("doubleOldBlack")
                }
            }
        case .wineGlass:
            return   SwiftUI.Image("wineGlassBlack")
        case .martini:
            return SwiftUI.Image("martiniBlack2")
        case .flute:
            return   SwiftUI.Image("fluteBlack2")
        case .snifter:
            return   SwiftUI.Image("snifterBlack")
        case .fizzGlass:
            return   SwiftUI.Image("smallHighBall")
        case .stemmedGlassware:
            return SwiftUI.Image("coupeBlack2")
        case .sugarRimStemmed:
            return SwiftUI.Image("martiniBlack2")
        case .nickAndNora:
            return   SwiftUI.Image("nickNNoraBlack")
        case .doubleOldSalt:
            if let ice = cocktail.ice  {
                if ice == .bigRock {
                    return SwiftUI.Image("doubleOldBFGBlack")
                } else {
                    return SwiftUI.Image("doubleOldBlack")
                }
            }
        case .doubleOldCelerySalt:
            if let ice = cocktail.ice  {
                if ice == .bigRock {
                    return SwiftUI.Image("doubleOldBFGBlack")
                } else {
                    return SwiftUI.Image("doubleOldBlack")
                }
            }
        case .julep:
            return SwiftUI.Image("julepCup")
        case .singleOld:
            return   SwiftUI.Image("singleOldBlack")
        case .tikiMug:
            return   SwiftUI.Image("tiki mug")
        case .toddyGlass:
            return SwiftUI.Image("toddy")
        } 
        return SwiftUI.Image("Urkel")
    }
}
