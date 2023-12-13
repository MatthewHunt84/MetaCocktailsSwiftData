//
//  Spirits.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 12/9/23.
//

import Foundation

enum SpiritCategory: String, Codable, CaseIterable {
    
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

struct Spirit {

    var name: String
    var type: SpiritCategory

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
    static func createSpiritCategoryArray() -> [String] {
        var spiritCategoryArray = [String]()
        
        for spirits in SpiritCategory.allCases {
            spiritCategoryArray.append(spirits.rawValue)
        }
        return spiritCategoryArray
    }


    static func makeAll() -> [Spirit] {
        
        var arrayOfSpirits = [Spirit]()
        
        for agave in Agave.allCases {
            arrayOfSpirits.append(Spirit(name: agave.rawValue, type: SpiritCategory.agave))
        }
        for amaro in Amari.allCases {
            arrayOfSpirits.append(Spirit(name: amaro.rawValue, type: SpiritCategory.amari))
        }
        for brandy in Brandy.allCases {
            arrayOfSpirits.append(Spirit(name: brandy.rawValue, type: SpiritCategory.brandy))
        }
        for gin in Gin.allCases {
            arrayOfSpirits.append(Spirit(name: gin.rawValue, type: SpiritCategory.gin))
        }
        for other in Other.allCases {
            arrayOfSpirits.append(Spirit(name: other.rawValue, type: SpiritCategory.other))
        }
        for rum in Rum.allCases {
            arrayOfSpirits.append(Spirit(name: rum.rawValue, type: SpiritCategory.rum))
        }
        for vodka in Vodka.allCases {
            arrayOfSpirits.append(Spirit(name: vodka.rawValue, type: SpiritCategory.vodka))
        }
        for whiskey in Whiskies.allCases {
            arrayOfSpirits.append(Spirit(name: whiskey.rawValue, type: SpiritCategory.whiskies))
        }
        for liqueur in Liqueur.allCases {
            arrayOfSpirits.append(Spirit(name: liqueur.rawValue, type: SpiritCategory.liqueur))
        }
        for fortifiedWine in FortifiedWine.allCases {
            arrayOfSpirits.append(Spirit(name: fortifiedWine.rawValue, type: SpiritCategory.fortifiedWine))
        }
        for wine in Wine.allCases {
            arrayOfSpirits.append(Spirit(name: wine.rawValue, type: SpiritCategory.wine))
        }
        for bitter in Bitters.allCases {
            arrayOfSpirits.append(Spirit(name: bitter.rawValue, type: SpiritCategory.bitters))
        }
        
 
        
        return arrayOfSpirits
    }
    
    

}
