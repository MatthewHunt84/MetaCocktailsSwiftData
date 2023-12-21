//
//  Booze.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 12/17/23.
//

import Foundation

protocol BoozeCategoryProtocol {
    var type: boozeCategory { get }
    var expressions: [String] { get }
}

enum boozeCategory: String, Codable, CaseIterable {
    
    case agave         = "Agave"
    case brandy        = "Brandy"
    case gin           = "Gin"
    case other         = "Other"
    case rum           = "Rum"
    case vodka         = "Vodka"
    case whiskies      = "Whiskies"
    case liqueur       = "Liqueur"
    case fortifiedWine = "Fortified Wine"
    case wine          = "Wine"
    case bitters       = "Bitters"
    case amari         = "Amari"
}



struct Booze: Codable { // was Spirit
    
    var expressionName: String
    var umbrellaCategory: boozeCategory 

}



struct Agave: BoozeCategoryProtocol {
    var type: boozeCategory = .agave
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Agave.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Brandy: BoozeCategoryProtocol {
    var type: boozeCategory = .brandy
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Brandy.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Gin: BoozeCategoryProtocol {
    var type: boozeCategory = .gin
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Gin.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Other: BoozeCategoryProtocol {
    var type: boozeCategory = .other
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Other.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Rum: BoozeCategoryProtocol {
    var type: boozeCategory = .rum
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Rum.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Vodka: BoozeCategoryProtocol {
    var type: boozeCategory = .vodka
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Vodka.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Whiskies: BoozeCategoryProtocol {
    var type: boozeCategory = .whiskies
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Whiskies.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Liqueur: BoozeCategoryProtocol {
    var type: boozeCategory = .liqueur
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Liqueur.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct FortifiedWine: BoozeCategoryProtocol {
    var type: boozeCategory = .fortifiedWine
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.FortifiedWine.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Wine: BoozeCategoryProtocol {
    var type: boozeCategory = .wine
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Wine.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Bitters: BoozeCategoryProtocol {
    var type: boozeCategory = .bitters
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Bitters.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Amari: BoozeCategoryProtocol {
    var type: boozeCategory = .amari
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Amari.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}






struct BoozeEnums {

    enum Agave: String, Codable, CaseIterable {

        case mezcalSmokey         = "Mezcal (Smokey)"
        case mezcalNotSmokey      = "Mezcal (Not Smokey)"
        case tequilaAnejo         = "Tequila Anejo"
        case tequilaBlanco        = "Tequila Blanco"
        case tequilaReposado      = "Tequila Reposado"
    }


    enum Brandy: String, Codable, CaseIterable {
        case armagnac             = "Armagnac"
        case cognacVSOP           = "Cognac (VSOP)"
        case pisco                = "Pisco"
    }

    enum Gin: String, Codable, CaseIterable {
        case gin                  = "Gin"
        case ginLondonDry         = "Gin (London Dry)"
    }

    // Other can be Aquavit, Malort, Absinthe etc.
    enum Other: String, Codable, CaseIterable {
        case absinthe             = "Absinthe"
    }

    enum Rum: String, Codable, CaseIterable {

        case cachaca              = "Cachaca"
        case rum                  = "Rum"
        case rumAged              = "Rum (Aged)"
        case rumBlackStrap        = "Rum (Black Strap)"
        case rumDemerara          = "Rum (Demerara)"
        case rumJamaicanAged      = "Rum (Jamaican, Aged)"
        case rumWhite             = "Rum (White)"
    }

    enum Vodka: String, Codable, CaseIterable {
        case vodka                = "Vodka"
        case vodkaCitrus          = "Vodka(Citrus Infused)"
    }

    enum Whiskies: String, Codable, CaseIterable {

        case bourbon              = "Bourbon"
        case irishWhiskey         = "Irish Whiskey"
        case ryeWhiskey           = "Rye Whiskey"
        case straightRyeOrBourbon = "Straight Rye or Bourbon (100 proof)"
        case scotchBlended        = "Scotch (Blended)"
        case scotchIsla           = "Scotch (Peated, From Isla)"
    }
    enum Liqueur: String, Codable, CaseIterable {

        case cointreau            = "Cointreau"
        case cremeDeCacao         = "Creme de Cacao"
        case giffardPamplemousse  = "Giffard Creme de Pamplemousse"
        case greenChartreuse      = "Green Chartreuse"
        case maraschinoLiqueur    = "Maraschino Liqueur"
        case orangeCuracao        = "Orange Curacao"
        case velvetFalernum       = "Velvet Falernum"
        case yellowChartreuse     = "Yellow Chartreuse"

    }
    enum FortifiedWine: String, Codable, CaseIterable {

        case amontillado          = "Amontillado Sherry"
        case blancVermouth        = "Blanc Vermouth"
        case cocchiAmericano      = "Cocchi Americano"
        case dryVermouth          = "French Dry Vermouth"
        case lilletBlanc          = "Lillet Blanc"
        case puntEMes             = "Punt E Mes"
        case rougeVermouth        = "Fruit Forward Rouge Vermouth"
        case sweetVermouth        = "Sweet Vermouth"
    }
    
    enum Wine: String, Codable, CaseIterable {

        case champagne            = "Chilled Champagne"
        case prosecco             = "Chilled Prosecco"

    }
    enum Bitters: String, Codable, CaseIterable {

        case orangeBitters        = "Orange Bitters"
        case angosturaBitters     = "Angostura Bitters"
        case peychauds            = "Peychaud's Bitters"
    }

    enum Amari: String, Codable, CaseIterable {

        case aperol               = "Aperol"
        case amaroMontenegro      = "Amaro Montenegro"
        case amaroNonino          = "Amaro Nonino"
        case becherovka           = "Becherovka"
        case campari              = "Campari"
        case fernetBranca         = "Fernet Branca"
        case fernetBrancaMenta    = "Fernet Branca Menta"
        case suze                 = "Suze"
    }
}
