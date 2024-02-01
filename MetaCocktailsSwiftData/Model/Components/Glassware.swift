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
    case buenaVistaIrish     = "Irish Coffee Glass (180ml)"
    case cinnamonSugarRim    = "Cinnamon Sugar Rimmed Cocktail Glass"
    case copperMuleCup       = "Copper Mule Cup"
    case coupe               = "Coupe"
    case coupeSalt           = "Coupe with a salted rim"
    case collins             = "Collins"
    case crustaGlass         = "Crusta Glass (See build order)"
    case doubleOld           = "Double Old Fashioned"
    case doubleOldCelerySalt = "Double Old Fashioned (half celery salt rim)"
    case doubleOldSalt       = "Double Old Fashioned (half salt rim)"
    case flute               = "Flute"
    case fizzGlass           = "Chilled 8 oz. Fizz Glass"
    case hurricaneGlass      = "Hurricane Glass"
    case julep               = "Julep Cup or Highball"
    case tikiBird            = "Bird Shaped Tiki Glass"
    case martini             = "Martini"
    case nickAndNora         = "Nick and Nora"
    case singleOld           = "Frozen Single Old Fashioned"
    case snifter             = "Snifter (Flip Glass)"
    case stemmedGlassware    = "Stemmed"
    case sugarRimStemmed     = "Stemmed with a half sugar rim"
    case tikiMug             = "Tiki Mug"
    case toddyGlass          = "Toddy Glass"
    case wineGlass           = "Large Wine Glass"
   
    func glassImage(cocktail: Cocktail) -> Image {
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
            return   SwiftUI.Image("fizzGlass")
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
            return   SwiftUI.Image("tikiMugs")
        case .toddyGlass:
            return SwiftUI.Image("toddy")
        case .hurricaneGlass:
            return SwiftUI.Image("hurricaneGlass")
        case .buenaVistaIrish:
            return SwiftUI.Image("buenaVistIrish")
        case .tikiBird:
            return SwiftUI.Image("junglebird")
        case .coupeSalt:
            return  SwiftUI.Image("coupeBlack2")
        case .copperMuleCup:
            return  SwiftUI.Image("muleCup")
        }
        return SwiftUI.Image("Urkel")
    }
}
