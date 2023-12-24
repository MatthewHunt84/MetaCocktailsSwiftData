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

struct CocktailIngredient: Decodable, Hashable, Identifiable {
    var id = UUID()
    
    static func == (lhs: CocktailIngredient, rhs: CocktailIngredient) -> Bool {
        lhs.ingredient.name > rhs.ingredient.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ingredient.name)
    }

    let ingredient: Booze // swiftData doesn't like reading a type that is only defined as a protocol without arduous Codable conformance methods.
    let value: Double
    let unit: MeasurementUnit
    
    init(_ ingredient: Booze, value: Double, unit: MeasurementUnit = .fluidOunces) {
        self.ingredient = ingredient
        self.value = value
        self.unit = unit
    }
    
    init(from decoder: Decoder) throws {
        self.ingredient = Booze(name: "aaa", boozeCategory: .agave, isBooze: true)
        self.value = 1.0
        self.unit = .barspoon
    }
    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(ingredient, forKey: .ingredient)
//    }
    
    func localizedVolumetricString(location: Location) -> String {
        switch location {
        case .usa:
            return "\(value) \(unit)"
        case .world:
            return "\(self.value * 29.5735) mls"
        }
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
