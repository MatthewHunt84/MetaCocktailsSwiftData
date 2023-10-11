//
//  Spirits.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/11/23.
//

import Foundation

enum Spirit: String, Codable {
    case gin            = "Gin"
    case whiteRum       = "White Rum"
    case agedRum        = "Aged Rum"
    case demeraraRum    = "Demerara Rum"
    case blackStrapRum  = "Black Strap Rum"
    case rum            = "Rum"
    case vodka          = "Vodka"
    case ryeWhiskey     = "Rye Whiskey"
    case blendedScotch  = "Blended Scotch"
    case peatedScotch   = "Peated Scotch"
    case islayScotch    = "Islay Scotch"
    case bourbon        = "Bourbon"
    
    
    // refactor enum into "Base" rather than "Spirit"?
    
    case aperol         = "Aperol"
    
}
