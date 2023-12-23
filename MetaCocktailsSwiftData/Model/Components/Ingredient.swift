//
//  Ingredient.swift
//  MetaCocktails
//
//  Created by Matthew Hunt on 8/30/23.
//

import Foundation
import SwiftData

protocol Ingredient {
    var isBooze: Bool { get }
    var name: String { get }
}

struct CocktailIngredient: Codable, Hashable {

    let ingredient: Ingredient
    let value: Double
    let unit: MeasurementUnit
    
    init(_ ingredient: Ingredient, value: Double, unit: MeasurementUnit = .fluidOunces) {
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
