//
//  Ingredient.swift
//  MetaCocktails
//
//  Created by Matthew Hunt on 8/30/23.
//

import Foundation
import SwiftData

protocol Ingredient: Codable {
    var isBooze: Bool { get }
    var name: String { get }
}

class CocktailIngredient: Codable, Hashable {

    let ingredient: any Ingredient
    let value: Double
    let unit: MeasurementUnit
    
    init(ingredient: Ingredient, value: Double, unit: MeasurementUnit = .fluidOunces) {
        self.ingredient = ingredient
        self.value = value
        self.unit = unit
    }
    
    func localizedVolumetricString(location: Location) -> String {
        switch location {
        case .usa:
            return "\(value) \(unit)"
        case .world:
            return "\(self.value * 29.5735) mls"
        }
    }
    
    // Decodable conformance
    
    private enum CodingKeys: CodingKey {
        case value
        case unit
        case ingredient
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        value = try values.decode(Double.self, forKey: .value)
        unit = try values.decode(MeasurementUnit.self, forKey: .unit)
        
        do {
            let boozeObject  = try values.decode(Booze.self, forKey: .ingredient)
            ingredient = boozeObject
        }
        catch {
            let nonAlcoholicObject = try values.decode(NonAlcoholic.self, forKey: .ingredient)
            ingredient = nonAlcoholicObject
        }
    }
    
    // Encodable conformance
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(value, forKey: .value)
        try container.encode(unit, forKey: .unit)
        try container.encode(ingredient, forKey: .ingredient)

    }
    
    // Hashable and Equatable conformance
    
    static func == (lhs: CocktailIngredient, rhs: CocktailIngredient) -> Bool {
        lhs.ingredient.name > rhs.ingredient.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ingredient.name)
    }
}




enum MeasurementUnit: String, Codable {
    case grams          = "grams"
    case fluidOunces    = "oz"
    case teaspoons      = "tsp"
    case disc           = "disc, with flesh"
    case limeQuarters   = "lime, quartered"
    case slices         = "slices"
    case sliceOf        = "slice of"
    case dash           = "dash"
    case dashes         = "dashes"
    case berries        = "berries"
    case leaves         = "leaves"
    case ml             = "ml"
    case barspoon       = "Barspoon"
    case pinch          = "Pinch"
    case whole          = "Whole (except the shell)"
    case sprays         = "Sprays in the glass (glass rinse)"
}
