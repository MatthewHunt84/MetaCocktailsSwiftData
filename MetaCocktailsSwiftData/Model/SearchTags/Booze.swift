//
//  Booze.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 11/17/23.
//

import Foundation

enum Booze: String, Codable, CaseIterable { // maybe a struct? Problem is connecting whiskies etc  in search function
    //Spirits
    case absinthe             = "Absinthe"
    case armagnac             = "Armagnac"
    case bourbon              = "Bourbon"
    case cachaca              = "Cachaca"
    case gin                  = "Gin"
    case ginLondonDry         = "Gin (London Dry)"
    case irishWhiskey         = "Irish Whiskey"
    case mezcalSmokey         = "Smokey Mezcal"
    case mezcalNotSmokey      = "Mezcal (Not Smokey)"
    case pisco                = "Pisco"
    case rum                  = "Rum"
    case rumAged              = "Rum (Aged)"
    case rumBlackStrap        = "Rum (Black Strap)"
    case rumDemerara          = "Rum (Demerara)"
    case rumJamaicanAged      = "Rum (Jamaican, Aged)"
    case rumWhite             = "Rum (White)"
    case ryeWhiskey           = "Rye Whiskey"
    case straightRyeOrBourbon = "Straight Rye or Bourbon (100 proof)"
    case scotchBlended        = "Scotch (Blended)"
    case scotchIsla           = "Scotch (Peated, From Isla)"
    case tequilaAnejo         = "Tequila Anejo"
    case tequilaBlanco        = "Tequila Blanco"
    case tequilaReposado      = "Tequila Reposado"
    case vodka                = "Vodka"
    case vodkaCitrus          = "Vodka(Citrus Infused)"
    case cognacVSOP           = "Cognac (VSOP)"
    
    // LIQEURS
    case cointreau            = "Cointreau"
    case cremeDeCacao         = "Creme de Cacao"
    case giffardPamplemousse  = "Giffard Creme de Pamplemousse"
    case greenChartreuse      = "Green Chartreuse"
    case maraschinoLiqueur    = "Maraschino Liqueur"
    case orangeCuracao        = "Orange Curacao"
    case velvetFalernum       = "Velvet Falernum"
    case yellowChartreuse     = "Yellow Chartreuse"
       
       
    // AMARI
    case aperol               = "Aperol"
    case amaroMontenegro      = "Amaro Montenegro"
    case amaroNonino          = "Amaro Nonino"
    case becherovka           = "Becherovka"
    case campari              = "Campari"
    case fernetBranca         = "Fernet Branca"
    case fernetBrancaMenta    = "Fernet Branca Menta"
    case suze                 = "Suze"
       
    //WINE
    case champagne            = "Chilled Champagne"
    case prosecco             = "Chilled Prosecco"
    
       
    //Fortified Wine
    case amontillado          = "Amontillado Sherry"
    case blancVermouth        = "Blanc Vermouth"
    case cocchiAmericano      = "Cocchi Americano"
    case dryVermouth          = "French Dry Vermouth"
    case lilletBlanc          = "Lillet Blanc"
    case puntEMes             = "Punt E Mes"
    case rougeVermouth        = "Fruit Forward Rouge Vermouth"
    case sweetVermouth        = "Sweet Vermouth"
    
    
    //bitters
    case orangeBitters        = "Orange Bitters"
    case angosturaBitters     = "Angostura Bitters"
    case peychauds            = "Peychaud's Bitters"
}
