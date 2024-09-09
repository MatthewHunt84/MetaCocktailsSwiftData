//
//  Profiles.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/11/23.
//

import Foundation

enum Profile: String, Codable, CaseIterable {
    case aromatic       = "Aromatic"
    case sweet          = "Sweet"
    case bitter         = "Bitter"
    case bittersweet    = "Bittersweet"
    case botanical      = "Botanical"
    case citrusy        = "Citrusy"
    case creamy         = "Creamy"
    case complex        = "Complex"
    case dry            = "Dry"
    case floral         = "Floral"
    case fruity         = "Fruity"
    case funky          = "Funky"
    case herbal         = "Herbal"
    case hot            = "Hot"
    case nutty          = "Nutty"
    case punchy         = "Punchy"
    case refreshing     = "Refreshing"
    case restorative    = "Restorative"
    case savory         = "Savory"
    case smokey         = "Smoky"
    case spicy          = "Spicy"
    case spiritForward  = "Spirit Forward"
    case tart           = "Tart"
    case tropical       = "Tropical"
    case vegetal        = "Vegetal"
    
    //textures
    case light          = "Light"
    case silky          = "Silky"
    case effervescent   = "Effervescent"
    case rich           = "Rich"
    
}
