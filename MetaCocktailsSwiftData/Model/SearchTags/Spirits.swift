//
//  Spirits.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 12/9/23.
//

import Foundation


struct Spirit { // delete me

    var name: String
    var type: SpiritCategoryName

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
