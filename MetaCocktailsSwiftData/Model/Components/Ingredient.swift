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

    let id = UUID()
    let ingredient: Ingredient
    let value: Double
    let unit: MeasurementUnit
    
    init(ingredient: Ingredient, value: Double, unit: MeasurementUnit) {
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

enum Ingredient: String, Codable {
    
    // NA

    case lemon             = "Lemon Juice"
    case lime              = "Lime Juice"
    case cream             = "Heavy Cream"
    case simple            = "Simple Syrup (1:1)"
    case granulatedSugar   = "Granulated Sugar"
    case orangeFlowerWater = "Orange Flower Water"
    case sodaWater         = "Soda Water"
    case eggWhites         = "Egg Whites"
    case gingerSyrup       = "Ginger Syrup"
    case honeySyrup        = "Honey Syrup"
    case richDem           = "Rich Demerara Syrup (2:1)"
    case passionfruitSyrup = "Passionfruit Syrup"
    case cucumberSyrup     = "Cucumber Syrup"
    case orgeat            = "Orgeat"
    case cranberryJuice    = "Cranberry Juice"
    case granadine         = "Grenadine (Pomegranate Syrup, Not Roses Grenadine)"
    case pineappleJuice    = "Fresh Pineapple Juice"
    
    // FRUIT
    case blackBerry        = "Blackberry"
    case sage              = "Sage"
    
    //Herbs
    case mint              = "Mint Leaves"

    // SPIRITS
    case gin               = "Gin"
    case whiteRum          = "White Rum"
    case agedRum           = "Aged Rum"
    case blackStrapRum     = "Black Strap Rum"
    case agedJamaicanRum   = "Aged Jamaican Rum"
    case rum               = "Rum"
    case vodka             = "Vodka"
    case citrusVodka       = "Citrus Vodka"
    case ryeWhiskey        = "Rye Whiskey"
    case peatedScotch      = "Peated Scotch (From Isla)"
    case blendedScotch     = "Blended Scotch"
    case bourbon           = "Bourbon"
    case demeraraRum       = "Demerara Rum"
    case cachaca           = "Cachaca"
    case VSOPCognac        = "VSOP Cognac"

    // LIQEURS
    case orangeCuracao     = "Orange Curacao"
    case cointreau         = "Cointreau"

    // AMARI
    case aperol            = "Aperol"
    case amaroNonino       = "Amaro Nonino"
    case campari           = "Campari"

    //WINE
    case prosecco          = "Chilled Prosecco"
    case champagne         = "Chilled Champagne"

    //Fortified Wine
    case sweetVermouth     = "Sweet Vermouth"
    case blancVermouth     = "Blanc Vermouth"
    case dryVermouth       = "French Dry Vermouth"
    case puntEMes          = "Punt E Mes"
    case cocchiAmericano   = "Cocchi Americano"
    case amontillado       = "Amontillado Sherry"

    //Water
    case sparklingWater    = "Chilled Sparkling Water"

    //Bitters
    case orangeBitters     = "Orange Bitters"
    case angosturaBitters  = "Angostura Bitters"


    
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
    case ml             = "ml"
    case barspoon       = "Barspoon"
}
