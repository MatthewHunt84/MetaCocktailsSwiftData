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
    let category: Category
    let tags: Tags?
    let value: Double
    let unit: MeasurementUnit
    let prep: Prep?
    let isCustom: Bool? 
    var matchesCurrentSearch: Bool
    
    
    init(_ name: String, ingredientCategory: Category, tagsWithSubcategories: Tags? = Tags(), value: Double, unit: MeasurementUnit = .fluidOunces, prep: Prep? = nil, isCustom: Bool? = false) {
        self.name = name
        self.category = ingredientCategory
        self.tags = tagsWithSubcategories
        self.value = value
        self.unit = unit
        self.id = UUID()
        self.prep = prep
        self.isCustom = isCustom
        self.matchesCurrentSearch = false
    }
    init(oldIngredient: CocktailIngredient) {
        self.id = UUID()
        self.name = oldIngredient.ingredient.name
        self.category = {
            var newCategory: Category = .agaves
            for category in Category.allCases {
                if oldIngredient.ingredient.category == category.rawValue {
                    newCategory = category
                    return newCategory
                }
            }
            return newCategory
        }()
        self.tags = oldIngredient.ingredient.tags
        self.value = oldIngredient.value
        self.unit = oldIngredient.unit
        self.prep = oldIngredient.prep
        self.isCustom = false
        self.matchesCurrentSearch = false
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
        case id, name, ingredientCategory, tagsWithSubcategories, value, unit, prep, matchesCurrentSearch
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.category = try container.decode(Category.self, forKey: .ingredientCategory)
        self.tags = try container.decode(Tags.self, forKey: .tagsWithSubcategories)
        self.value = try container.decode(Double.self, forKey: .value)
        self.unit = try container.decode(MeasurementUnit.self, forKey: .unit)
        self.prep = try container.decode(Prep.self, forKey: .prep)
        self.matchesCurrentSearch = try container.decode(Bool.self, forKey: .matchesCurrentSearch)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(value, forKey: .value)
        try container.encode(name, forKey: .name)
        try container.encode(category, forKey: .ingredientCategory)
        try container.encode(tags, forKey: .tagsWithSubcategories)
        try container.encode(unit, forKey: .unit)
        try container.encode(prep, forKey: .prep)
        try container.encode(matchesCurrentSearch, forKey: .matchesCurrentSearch)
    }
}



enum Category: String, Codable, CaseIterable  {
    
    case syrups            = "Syrups"
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


