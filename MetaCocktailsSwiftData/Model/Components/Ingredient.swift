//
//  Ingredient.swift
//  MetaCocktails
//
//  Created by Matthew Hunt on 8/30/23.
//

import Foundation
import SwiftData

@Model
class CocktailIngredient {
    @Attribute(.unique)
    let name: Ingredient
    let value: Double
    let unit: MeasurementUnit
    
    init(name: Ingredient, value: Double, unit: MeasurementUnit = .fluidOunces) {
        self.name = name
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

enum Ingredient: String, Codable {
    
    // NA

    case lemon             = "Lemon Juice"
    case lime              = "Lime Juice"
    case cream             = "Heavy Cream"
    case simple            = "Simple Syrup (1:1)"
    case orangeFlowerWater = "Orange Flower Water"
    case sodaWater         = "Soda Water"
    case eggWhites         = "Egg Whites"
    case gingerSyrup       = "Ginger Syrup"
    case honeySyrup        = "Honey Syrup"
    case richDem           = "Rich Demerara Syrup (2:1)"
    case passionfruitSyrup = "Passionfruit Syrup"
    case cucumberSyrup     = "Cucumber Syrup"
    case orgeat            = "Orgeat"
    
    // FRUIT
    case blackBerry        = "Blackberry"
    case sage              = "Sage"
    
    /// SPIRITS
    case gin            = "Gin"
    case whiteRum       = "White Rum"
    case agedRum        = "Aged Rum"
    case blackStrapRum  = "Black Strap Rum"
    case rum            = "Rum"
    case vodka          = "Vodka"
    case ryeWhiskey     = "Rye Whiskey"
    
    mutating func someFunctionThatAppendsSearchIngredientStuffIntoTags(for: inout Tags) {
       // This function will take a Tags object, and automatically add to it based on the ingredients
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
}
