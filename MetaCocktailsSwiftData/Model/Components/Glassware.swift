//
//  Glassware.swift
//  MetaCocktails
//
//  Created by Matthew Hunt on 8/30/23.
//

import Foundation
import SwiftUI

enum Glassware: String, Codable, CaseIterable {
    
    // most common
    case doubleOld                 = "Double Old Fashioned"
    case coupe                     = "Coupe"
    case martini                   = "Martini"
    case collins                   = "Collins"
    case fizzGlass                 = "Chilled 8 oz. Fizz Glass"
    case singleOld                 = "Frozen Single Old Fashioned"
    case nickAndNora               = "Nick and Nora"
    case tikiMug                   = "Tiki Mug"
    case flute                     = "Flute"
    case julep                     = "Julep Cup"
    case stemmedGlassware          = "Stemmed"
    
    case coupeSalt                 = "Coupe with a salted rim"
    case doubleOldSalt             = "Double Old Fashioned (half salt rim)"
    case snifter                   = "Snifter (Flip Glass)"
    case blueBlazerMugs            = "Blue Blazer Mugs"
    case buenaVistaIrish           = "Irish Coffee Glass (180ml)"
    case cinnamonSugarRim          = "Cinnamon Sugar Rimmed Cocktail Glass"
    case copperMuleCup             = "Copper Mule Cup"
    
    case crustaGlass               = "Crusta Glass (See build order)"
    
    case doubleOldAsparagusSaltRim = "Double Old Fashioned (half asparagus salt rim)"
    case doubleOldCelerySalt       = "Double Old Fashioned (half celery salt rim)"
    
    case doubleOldSmokedSalt       = "Double Old Fashioned (half smoked salt rim)"
    
    
    case hurricaneGlass            = "Hurricane Glass"
    
    case teaCup                    = "Ornate Tea Cup"
    case tikiBird                  = "Bird Shaped Tiki Glass"
    
    case milkShake                 = "Milkshake Glass"
    
    
    
    case sugarRimStemmed           = "Stemmed with a half sugar rim"
    
    case toddyGlass                = "Toddy Glass"
    case wineGlass                 = "Large Wine Glass"
   
    func glassImage(cocktail: Cocktail) -> Image {
        switch self {
        case .blueBlazerMugs:
            return  SwiftUI.Image("Blue Blazer Mugs")
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
            } else {
               return SwiftUI.Image("doubleOldBlack")
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
        case .doubleOldAsparagusSaltRim:
            return SwiftUI.Image("doubleOldBFGBlack")
        case .doubleOldSmokedSalt:
            return SwiftUI.Image("doubleOldBFGBlack")
        case .teaCup:
            return SwiftUI.Image("teaCup")
        case .milkShake:
            return SwiftUI.Image("milkShake")
        }
        return SwiftUI.Image("Urkel")
    }
    
    func findGlass(for: Glassware) -> Image {
        switch self {
        case .blueBlazerMugs:
            return  SwiftUI.Image("Blue Blazer Mugs")
        case .cinnamonSugarRim:
            return  SwiftUI.Image("martiniBlack2")
        case .coupe:
            return  SwiftUI.Image("coupeBlack2")
        case .collins:
            return   SwiftUI.Image("collinsBlack")
        case .crustaGlass:
            return   SwiftUI.Image("brandy crusta")
        case .doubleOld:
            return SwiftUI.Image("doubleOldBlack")
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
            return SwiftUI.Image("doubleOldBlack")
        case .doubleOldCelerySalt:
            return SwiftUI.Image("doubleOldBlack")
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
        case .doubleOldAsparagusSaltRim:
            return SwiftUI.Image("doubleOldBFGBlack")
        case .doubleOldSmokedSalt:
            return SwiftUI.Image("doubleOldBFGBlack")
        case .teaCup:
            return SwiftUI.Image("teaCup")
        case .milkShake:
            return SwiftUI.Image("milkShake")
        }
        
    }
}
