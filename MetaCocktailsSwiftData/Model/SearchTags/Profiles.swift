//
//  Profiles.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/11/23.
//

import Foundation

enum Profile: String, Codable, CaseIterable {
    case tart           = "Tart"
    case sweet          = "Sweet"
    case bitter         = "Bitter"
    case bittersweet    = "Bittersweet"
    case spicy          = "Spicy"
    case citrusy        = "Citrusy"
    case aromatic       = "Aromatic"
    case vegetal        = "Vegetal"
    case floral         = "Floral"
    case funky          = "Funky"
    case fruity         = "Fruity"
    case dry            = "Dry"
    case smokey         = "Smokey"
    case creamy         = "Creamy (Profile)"
    case sharp          = "Sharp"
    case tropical       = "Tropical"
    case herbal         = "Herbal"
    case medicinal      = "Medicinal"
    case botanical      = "Botanical"
    case nutty          = "Nutty"
    case bright         = "Bright"
    //TODO: lets add spiritForward on a per cocktail basis!
    case spiritForward  = "Spirit Forward" // lets add these on a per cocktail basis.
    case refreshing     = "Refreshing"
    
}
