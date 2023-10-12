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
    case spicy          = "Spicy"
    case citrusy        = "Citrusy"
    case aromatic       = "Aromatic"
    case floral         = "Floral"
    case fruity         = "Fruity"
    case herbal         = "Herbal"
    case bakingSpices   = "Baking Spices"
    case smokey         = "Smokey"
}
