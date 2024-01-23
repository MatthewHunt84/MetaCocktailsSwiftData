//
//  IngredientType.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 12/26/23.
//

import Foundation

enum IngredientType: Codable {
    
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
    
    static func getNAComponents() -> [CocktailComponent] {
        var cocktailComponentArrayForNA = [CocktailComponent]()
        
        cocktailComponentArrayForNA.append(contentsOf: Syrup.allCases.map({ $0.nAComponent}))
        cocktailComponentArrayForNA.append(contentsOf: Juice.allCases.map({ $0.nAComponent}))
        cocktailComponentArrayForNA.append(contentsOf: Herbs.allCases.map({ $0.nAComponent}))
        cocktailComponentArrayForNA.append(contentsOf: Fruit.allCases.map({ $0.nAComponent}))
        cocktailComponentArrayForNA.append(contentsOf: Seasoning.allCases.map({ $0.nAComponent}))
        cocktailComponentArrayForNA.append(contentsOf: Soda.allCases.map({ $0.nAComponent}))
        cocktailComponentArrayForNA.append(contentsOf: OtherNA.allCases.map({ $0.nAComponent}))
        
        
        return cocktailComponentArrayForNA
    }
    
    static func getBoozeComponents() -> [CocktailComponent] {
        
        var CocktailComponentArrayForBooze = [CocktailComponent]()
        
        CocktailComponentArrayForBooze.append(contentsOf: Agave.allCases.map { $0.cockTailComponent })
        CocktailComponentArrayForBooze.append(contentsOf: Brandy.allCases.map { $0.cockTailComponent })
        CocktailComponentArrayForBooze.append(contentsOf: Gin.allCases.map { $0.cockTailComponent })
        CocktailComponentArrayForBooze.append(contentsOf: OtherAlcohol.allCases.map { $0.cockTailComponent })
        CocktailComponentArrayForBooze.append(contentsOf: Rum.allCases.map { $0.cockTailComponent })
        CocktailComponentArrayForBooze.append(contentsOf: Vodka.allCases.map { $0.cockTailComponent })
        CocktailComponentArrayForBooze.append(contentsOf: Whiskey.allCases.map { $0.cockTailComponent })
        CocktailComponentArrayForBooze.append(contentsOf: Liqueur.allCases.map { $0.cockTailComponent })
        CocktailComponentArrayForBooze.append(contentsOf: FortifiedWine.allCases.map { $0.cockTailComponent })
        CocktailComponentArrayForBooze.append(contentsOf: Wine.allCases.map { $0.cockTailComponent })
        CocktailComponentArrayForBooze.append(contentsOf: Bitters.allCases.map { $0.cockTailComponent })
        CocktailComponentArrayForBooze.append(contentsOf: Amaro.allCases.map { $0.cockTailComponent })
        
        return CocktailComponentArrayForBooze
    }
    
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
            return "Syrups"
        case .juices:
            return "Juice"
        case .herbs:
            return "Herbs"
        case .fruit:
            return "Fruit"
        case .seasoning:
            return "Seasoning"
        case .soda:
            return "Sodas"
        case .otherNonAlc:
            return "Other N/A"
        case .agaves:
            return "Agave"
        case .brandies:
            return "Brandy"
        case .gins:
            return "Gin"
        case .otherAlcohol:
            return "Other Alcohol"
        case .rums:
            return "Rum"
        case .vodkas:
            return "Vodka"
        case .whiskies:
            return "Whiskies"
        case .liqueurs:
            return "Liqueurs"
        case .fortifiedWines:
            return "Fortified Wine"
        case .wines:
            return "Wine"
        case .bitters:
            return "Bitters"
        case .amari:
            return "Amari"
        }
    }
}

enum MeasurementUnit: String, Codable {
    case peel           = "Peel(s)"
    case grams          = "grams"
    case fluidOunces    = "oz"
    case teaspoons      = "tsp"
    case disc           = "disc, with flesh"
    case limeQuarters   = "lime, quartered"
    case slices         = "slices"
    case sliceOf        = "slice of"
    case dash           = "dash"
    case dashes         = "dashes"
    case drops          = "drops"
    case muddled        = "Muddled"
    case gentlyMuddled  = "Gently muddled"
    case nitroMuddled   = "Nitro muddled"
    case ml             = "ml"
    case teaspoon       = "teaspoon"
    case pinch          = "Pinch"
    case whole          = "Whole"
    case glassRinse     = "Rinse the glass with"
    case rim            = "Around the rim of the glass"
}
