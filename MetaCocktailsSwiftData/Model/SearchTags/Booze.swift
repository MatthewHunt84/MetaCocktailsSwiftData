//
//  Booze.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 12/17/23.
//

import Foundation


struct Booze: Codable, Ingredient {
    var name: String
    var boozeCategory: BoozeCategory
    var isBooze: Bool
}
protocol BoozeProtocol {
    var type: BoozeCategory { get }
    var expressions: [String] { get }
}

enum BoozeCategory: String, Codable, CaseIterable {
    
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


var cognacVSOP: Ingredient = Booze(name: "CognacVSOP", boozeCategory: .brandy, isBooze: true)





struct Agave: BoozeProtocol {
    var type: BoozeCategory = .agave
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Agave.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Brandy: BoozeProtocol {
    var type: BoozeCategory = .brandy
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Brandy.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Gin: BoozeProtocol {
    var type: BoozeCategory = .gin
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Gin.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct OtherBooze: BoozeProtocol {
    var type: BoozeCategory = .other
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Other.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Rum: BoozeProtocol {
    var type: BoozeCategory = .rum
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Rum.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Vodka: BoozeProtocol {
    var type: BoozeCategory = .vodka
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Vodka.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Whiskies: BoozeProtocol {
    var type: BoozeCategory = .whiskies
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Whiskies.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Liqueur: BoozeProtocol {
    var type: BoozeCategory = .liqueur
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Liqueur.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct FortifiedWine: BoozeProtocol {
    var type: BoozeCategory = .fortifiedWine
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.FortifiedWine.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Wine: BoozeProtocol {
    var type: BoozeCategory = .wine
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Wine.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Bitters: BoozeProtocol {
    var type: BoozeCategory = .bitters
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Bitters.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Amari: BoozeProtocol {
    var type: BoozeCategory = .amari
    
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
