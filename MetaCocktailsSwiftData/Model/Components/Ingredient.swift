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
    let prep: Prep?
    
    
    init(_ ingredient: IngredientType, value: Double, unit: MeasurementUnit = .fluidOunces, prep: Prep? = nil) {
        self.ingredient = ingredient
        self.value = value
        self.unit = unit
        self.id = UUID()
        self.prep = prep
    }
    
    func localizedVolumetricString(location: Location) -> String {
        switch location {
        case .usa:
            return "\(value) \(unit)"
        case .world:
            return "\(self.value * 29.5735) mls"
        }
    }
    
    // MARK: Equatable + Hashable Conformance
    
    static func == (lhs: CocktailIngredient, rhs: CocktailIngredient) -> Bool {
        lhs.id > rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // MARK: - @Model codable conformance

    enum CodingKeys: CodingKey {
        case id, ingredient, value, unit, prep
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.ingredient = try container.decode(IngredientType.self, forKey: .ingredient)
        self.value = try container.decode(Double.self, forKey: .value)
        self.unit = try container.decode(MeasurementUnit.self, forKey: .unit)
        self.prep = try container.decode(Prep.self, forKey: .prep)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(value, forKey: .value)
        try container.encode(ingredient, forKey: .ingredient)
        try container.encode(unit, forKey: .unit)
        try container.encode(prep, forKey: .prep
        )
    }
}


@Model
class Ingredient: Codable, Hashable {

    let id: UUID
    let name: String
    let ingredientCategory: IngredientCategory
    let tagsWithSubcategories: Tags?
    let value: Double
    let unit: MeasurementUnit
    let prep: Prep?
    
    
    init(_ name: String, ingredientCategory: IngredientCategory, tagsWithSubcategories: Tags? = Tags(), value: Double, unit: MeasurementUnit = .fluidOunces, prep: Prep? = nil) {
        self.name = name
        self.ingredientCategory = ingredientCategory
        self.tagsWithSubcategories = tagsWithSubcategories
        self.value = value
        self.unit = unit
        self.id = UUID()
        self.prep = prep
    }
    
    func localizedVolumetricString(location: Location) -> String {
        switch location {
        case .usa:
            return "\(value) \(unit)"
        case .world:
            return "\(self.value * 29.5735) mls"
        }
    }
    
    // MARK: Equatable + Hashable Conformance
    
    static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        lhs.id > rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // MARK: - @Model codable conformance

    enum CodingKeys: CodingKey {
        case id, name, ingredientCategory, tagsWithSubcategories, value, unit, prep
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.ingredientCategory = try container.decode(IngredientCategory.self, forKey: .ingredientCategory)
        self.tagsWithSubcategories = try container.decode(Tags.self, forKey: .tagsWithSubcategories)
        self.value = try container.decode(Double.self, forKey: .value)
        self.unit = try container.decode(MeasurementUnit.self, forKey: .unit)
        self.prep = try container.decode(Prep.self, forKey: .prep)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(value, forKey: .value)
        try container.encode(name, forKey: .name)
        try container.encode(ingredientCategory, forKey: .ingredientCategory)
        try container.encode(tagsWithSubcategories, forKey: .tagsWithSubcategories)
        try container.encode(unit, forKey: .unit)
        try container.encode(prep, forKey: .prep
        )
    }
}



enum IngredientCategory: String, Codable, CaseIterable  {
    
    case syrups            = "Syrup"
    case juices            = "Juice"
    case herbs             = "Herbs"
    case fruit             = "Fruit"
    case seasoning         = "Seasoning"
    case soda              = "Sodas"
    case otherNonAlc       = "Other N/A"
    case agaves            = "Agave"
    case brandies          = "Brandy"
    case gins              = "Gin"
    case otherAlcohol      = "Other Alcohol"
    case rums              = "Rum"
    case vodkas            = "Vodka"
    case whiskies          = "Whiskies"
    case liqueurs          = "Liqueurs"
    case fortifiedWines    = "Fortified Wine"
    case wines             = "Wine"
    case bitters           = "Bitters"
    case amari             = "Amari"
    
    
    
}


