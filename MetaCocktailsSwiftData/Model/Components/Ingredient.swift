//
//  Ingredient.swift
//  MetaCocktails
//
//  Created by Matthew Hunt on 8/30/23.
//

import Foundation
import SwiftData

@Model
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
    
    // MARK: - @Model codable conformance
    
    enum CodingKeys: CodingKey {
        case id, ingredient, value, unit
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.ingredient = try container.decode(IngredientType.self, forKey: .ingredient)
        self.value = try container.decode(Double.self, forKey: .value)
        self.unit = try container.decode(MeasurementUnit.self, forKey: .unit)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(value, forKey: .value)
        try container.encode(ingredient, forKey: .ingredient)
        try container.encode(unit, forKey: .unit)
    }
}





