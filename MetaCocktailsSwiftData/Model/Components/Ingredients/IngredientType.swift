//
//  IngredientType.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 12/26/23.
//

import Foundation

enum IngredientType: Codable{
    
    case syrups(Syrup)
    case juices(Juice)
    case herbs(Herbs)
    case fruit(Fruit)
    case seasoning(Seasoning)
    case soda(Soda)
    case otherNonAlc(OtherNA)
    
    case agaves(Agave)
    case brandies(Brandy)
    case gins(Gin)
    case otherAlcohol(OtherAlcohol)
    case rums(Rum)
    case vodkas(Vodka)
    case whiskies(Whiskey)
    case liqueurs(Liqueur)
    case fortifiedWines(FortifiedWine)
    case wines(Wine)
    case bitters(Bitters)
    case amari(Amaro)
    

    
    var tags: Tags {
        switch self {
        case .syrups(let syrup):
            return syrup.tags
        case .juices(let juice):
            return juice.tags
        case .herbs(let herb):
            return herb.tags
        case .fruit(let fruit):
            return fruit.tags
        case .seasoning(let seasoning):
            return seasoning.tags
        case .soda(let soda):
            return soda.tags
        case .otherNonAlc(let otherNA):
            return otherNA.tags
            
        case .agaves(let agave):
            return agave.tags
        case .brandies(let brandy):
            return brandy.tags
        case .gins(let gin):
            return gin.tags
        case .otherAlcohol(let otherAlcohol):
            return otherAlcohol.tags
        case .rums(let rum):
            return rum.tags
        case .vodkas(let vodka):
            return vodka.tags
        case .whiskies(let whiskey):
            return whiskey.tags
        case .liqueurs(let liqueur):
            return liqueur.tags
        case .fortifiedWines(let fortifiedWine):
            return fortifiedWine.tags
        case .wines(let wine):
            return wine.tags
        case .bitters(let bitters):
            return bitters.tags
        case .amari(let amaro):
            return amaro.tags
        }
    }
    
    var name: String {
        switch self {
        case .syrups(let syrup):
            return syrup.rawValue
        case .juices(let juice):
            return juice.rawValue
        case .herbs(let herb):
            return herb.rawValue
        case .fruit(let fruit):
            return fruit.rawValue
        case .seasoning(let seasoning):
            return seasoning.rawValue
        case .soda(let soda):
            return soda.rawValue
        case .otherNonAlc(let otherNA):
            return otherNA.rawValue
        case .agaves(let agave):
            return agave.rawValue
        case .brandies(let brandy):
            return brandy.rawValue
        case .gins(let gin):
            return gin.rawValue
        case .otherAlcohol(let otherAlcohol):
            return otherAlcohol.rawValue
        case .rums(let rum):
            return rum.rawValue
        case .vodkas(let vodka):
            return vodka.rawValue
        case .whiskies(let whiskey):
            return whiskey.rawValue
        case .liqueurs(let liqueur):
            return liqueur.rawValue
        case .fortifiedWines(let fortifiedWine):
            return fortifiedWine.rawValue
        case .wines(let wine):
            return wine.rawValue
        case .bitters(let bitters):
            return bitters.rawValue
        case .amari(let amaro):
            return amaro.rawValue
        }
    }
    
    
    var category: String {
        switch self {
        case .syrups:
            return UmbrellaCategory.syrups.rawValue
        case .juices:
            return UmbrellaCategory.juices.rawValue
        case .herbs:
            return UmbrellaCategory.herbs.rawValue
        case .fruit:
            return UmbrellaCategory.fruit.rawValue
        case .seasoning:
            return UmbrellaCategory.seasoning.rawValue
        case .soda:
            return UmbrellaCategory.soda.rawValue
        case .otherNonAlc:
            return UmbrellaCategory.otherNonAlc.rawValue
        case .agaves:
            return UmbrellaCategory.agaves.rawValue
        case .brandies:
            return UmbrellaCategory.brandies.rawValue
        case .gins:
            return UmbrellaCategory.gins.rawValue
        case .otherAlcohol:
            return UmbrellaCategory.otherAlcohol.rawValue
        case .rums:
            return UmbrellaCategory.rums.rawValue
        case .vodkas:
            return UmbrellaCategory.vodkas.rawValue
        case .whiskies:
            return UmbrellaCategory.whiskies.rawValue
        case .liqueurs:
            return UmbrellaCategory.liqueurs.rawValue
        case .fortifiedWines:
            return UmbrellaCategory.fortifiedWines.rawValue
        case .wines:
            return UmbrellaCategory.wines.rawValue
        case .bitters:
            return UmbrellaCategory.bitters.rawValue
        case .amari:
            return UmbrellaCategory.amari.rawValue
        }
    }
}

enum MeasurementUnit: String, Codable, CaseIterable {
    
    case barSpoon           = "bar-spoon"
    case bottles            = "bottle"
    case dashes             = "dash"
    case drops              = "drop"
    case fluidOunces        = "oz"
    case gentlyMuddled      = "gently muddled"
    case grams              = "gram"
    case ml                 = "ml"
    case muddled            = "muddled"
    case nitroMuddled       = "nitro muddled"
    case none               = ""
    case peel               = "Peel"
    case pinch              = "pinch"
    case sliceOf            = "slice of"
    case splash             = "splash of"
    case sprays             = "spray"
    case teaspoon           = "tsp"
    case tablespoon         = "tbsp"
    case whole              = "whole"
    
    var canBePluralized: Bool {
        switch self {
        case .fluidOunces, .gentlyMuddled, .muddled, .nitroMuddled, .none, .teaspoon, .tablespoon, .whole:
            false
        default:
            true
        }
    }
}
