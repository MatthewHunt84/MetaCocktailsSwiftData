//
//  CocktailMenuViewModel.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/25/24.
//

import SwiftUI

final class CocktailMenuViewModel: ObservableObject {
    
    
    static func getCocktailGlass(cocktail: Cocktail) -> Image {
        
        if cocktail.glasswareType == .coupe || cocktail.glasswareType == .stemmedGlassware  {
            return  Image("coupeBlack2")
            
        }
        if cocktail.glasswareType == .martini || cocktail.glasswareType == .cinnamonSugarRim || cocktail.glasswareType == .sugarRimStemmed{
            return  Image("martiniBlack2")
        }
        if cocktail.glasswareType == .doubleOld && cocktail.ice == .bigRock {
            return  Image("doubleOldBFGBlack")
            
        } else if (cocktail.glasswareType == .doubleOld || cocktail.glasswareType == .doubleOldSalt || cocktail.glasswareType == .doubleOldCelerySalt ) && cocktail.ice != .bigRock {
            return   Image("doubleOldBlack")
            
        }
        if cocktail.glasswareType == .flute {
            return   Image("fluteBlack2")
        }
        if cocktail.glasswareType == .collins {
            return   Image("collinsBlack")
        }
        if cocktail.glasswareType == .wineGlass {
            return   Image("wineGlassBlack")
        }
        if cocktail.glasswareType == .nickAndNora {
            return   Image("nickNNoraBlack")
        }
        if cocktail.glasswareType == .fizzGlass {
            return   Image("smallHighBall")
        }
        if cocktail.glasswareType == .crustaGlass {
            return   Image("brandy crusta")
            
        }
        if cocktail.glasswareType == .julep {
            return    Image("julepCup")
        }
        if cocktail.glasswareType == .tikiMug {
            return   Image("tiki mug")
        }
        if cocktail.glasswareType == .snifter {
            return   Image("snifterBlack")
        }
        if cocktail.glasswareType == .singleOld {
            return   Image("singleOldBlack")
        }
        
        return Image("Urkel")
        
    }
    
    
}
