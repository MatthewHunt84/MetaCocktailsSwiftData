//
//  Ingredient.swift
//  MetaCocktails
//
//  Created by Matthew Hunt on 8/30/23.
//

import Foundation
import SwiftData

class CocktailIngredient: Codable, Hashable {

    let id: UUID
    let ingredient: IngredientType
    let value: Double
    let unit: MeasurementUnit
    
    init(_ ingredient: IngredientType, value: Double, unit: MeasurementUnit = .fluidOunces) {
        self.ingredient = ingredient
        self.value = value
        self.unit = unit
        self.id = UUID()
    }
    
    func localizedVolumetricString(location: Location) -> String {
        switch location {
        case .usa:
            return "\(value) \(unit)"
        case .world:
            return "\(self.value * 29.5735) mls"
        }
    }
    
    // Equatable + Hashable Conformance
    
    static func == (lhs: CocktailIngredient, rhs: CocktailIngredient) -> Bool {
        lhs.id > rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}





