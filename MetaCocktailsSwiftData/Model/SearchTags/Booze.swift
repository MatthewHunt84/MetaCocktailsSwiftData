//
//  Booze.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 12/17/23.
//

import Foundation

protocol BoozeCategory {
    var type: SpiritCategoryName { get }
    var expressions: [String] { get }
}

enum SpiritCategoryName: String, Codable, CaseIterable { // <- rename to boozeCategory
    
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


struct fakeViewModel { // these go in the viewModel
    
    func generateAllBooze() -> [Booze] {

        let boozeCategoryArray: [BoozeCategory] = [Agave(), Brandy(), Gin(), Other(), Rum(), Vodka(), Whiskies(), Liqueur(), FortifiedWine(), Wine(), Bitters(), Amari()]
        var boozeArray: [Booze] =  [Booze]()
        
        for category in boozeCategoryArray {
            for expression in category.expressions {
                let boozeObject = Booze(name: expression, type: category.type)
                boozeArray.append(boozeObject)
            }
        }
        
        return boozeArray
        
    }
    
    func generateCocktailComponents(for arrayOfBooze: [Booze])  -> [CocktailComponent] {
        var arrayOfComponents: [CocktailComponent] = [CocktailComponent]()
        for booze in arrayOfBooze {
            arrayOfComponents.append(CocktailComponent(for: booze))
        }

        return arrayOfComponents
    }
}


struct Booze { // was Spirit
    
    var name: String
    var type: SpiritCategoryName // <- rename to boozeCategory

}



struct Agave: BoozeCategory {
    var type: SpiritCategoryName = .agave
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Agave.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Brandy: BoozeCategory {
    var type: SpiritCategoryName = .brandy
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Brandy.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Gin: BoozeCategory {
    var type: SpiritCategoryName = .gin
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Gin.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Other: BoozeCategory {
    var type: SpiritCategoryName = .other
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Other.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Rum: BoozeCategory {
    var type: SpiritCategoryName = .rum
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Rum.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Vodka: BoozeCategory {
    var type: SpiritCategoryName = .vodka
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Vodka.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Whiskies: BoozeCategory {
    var type: SpiritCategoryName = .whiskies
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Whiskies.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Liqueur: BoozeCategory {
    var type: SpiritCategoryName = .liqueur
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Liqueur.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct FortifiedWine: BoozeCategory {
    var type: SpiritCategoryName = .fortifiedWine
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.FortifiedWine.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Wine: BoozeCategory {
    var type: SpiritCategoryName = .wine
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Wine.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Bitters: BoozeCategory {
    var type: SpiritCategoryName = .bitters
    
    var expressions: [String] = {
        var arrayOfExpressions = [String]()
        for expression in BoozeEnums.Bitters.allCases {
            arrayOfExpressions.append(expression.rawValue)
        }
        return arrayOfExpressions
    }()
}

struct Amari: BoozeCategory {
    var type: SpiritCategoryName = .amari
    
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
