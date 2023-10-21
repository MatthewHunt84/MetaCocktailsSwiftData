//
//  Spirits.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/11/23.
//

import Foundation

enum Bases: String, Codable, CaseIterable {
    //Spirits
    case armagnac             = "Armagnac"
    case bourbon              = "Bourbon"
    case cachaca              = "Cachaca"
    case gin                  = "Gin"
    case ginLondonDry         = "Gin (London Dry)"
    case irishWhiskey         = "Irish Whiskey"
    case mezcalSmokey         = "Smokey Mezcal"
    case mezcalNotSmokey      = "Mazcal (Not Smokey)"
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
    case vodkaCitrus          = "Vodka(Citrus Infused"
    case cognacVSOP           = "Cognac (VSOP)"
       
       
    // AMARI
    case aperol               = "Aperol"
    case amaroMontenegro      = "Amaro Montenegro"
    case amaroNonino          = "Amaro Nonino"
    case campari              = "Campari"
       
    //WINE
    case champagne            = "Chilled Champagne"
    case prosecco             = "Chilled Prosecco"
    
       
    //Fortified Wine
    case amontillado          = "Amontillado Sherry"
    case blancVermouth        = "Blanc Vermouth"
    case cocchiAmericano      = "Cocchi Americano"
    case dryVermouth          = "French Dry Vermouth"
    case puntEMes             = "Punt E Mes"
    case sweetVermouth        = "Sweet Vermouth"
}
