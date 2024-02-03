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
    case bright         = "Bright"
    case citrusy        = "Citrusy"
    case creamy         = "Creamy"
    case comforting     = "Comforting"
    case complex        = "Complex"
    case dry            = "Dry"
    case delicate       = "Delicate"
    case elegant        = "Elegant"
    case floral         = "Floral"
    case fruity         = "Fruity"
    case funky          = "Funky"
    case gross          = "Gross"
    case herbal         = "Herbal"
    case hot            = "Hot"
    case medicinal      = "Medicinal"
    case nutty          = "Nutty"
    case punchy         = "Punchy"
    case refreshing     = "Refreshing"
    case restorative    = "Restorative"
    case savory         = "Savory"
    case sharp          = "Sharp"
    case smokey         = "Smokey"
    case sophisticated  = "Sophisticated"
    case spicy          = "Spicy"
    case spiritForward  = "Spirit Forward"
    case tart           = "Tart"
    case tropical       = "Tropical"
    case vegetal        = "Vegetal"
    
    /// Below were in "Textures" previously
    case light          = "Light"
    case silky          = "Silky"
    case thin           = "Thin"
    case effervescent   = "Effervescent"
    case rich           = "Rich"
    case unrefined      = "Unrefined"
    
    
}
