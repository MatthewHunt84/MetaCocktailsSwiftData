//
//  Spirits.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/11/23.
//

import Foundation

enum Bases: String, Codable, CaseIterable {
    //Spirits
    case gin               = "Gin"
    case whiteRum          = "White Rum"
    case agedRum           = "Aged Rum"
    case blackStrapRum     = "Black Strap Rum"
    case agedJamaicanRum   = "Aged Jamaican Rum"
    case rum               = "Rum"
    case vodka             = "Vodka"
    case ryeWhiskey        = "Rye Whiskey"
    case citrusVodka       = "Citrus Vodka"
    case peatedScotch      = "Peated Scotch (From Isla)"
    case blendedScotch     = "Blended Scotch"
    case bourbon           = "Bourbon"
    case demeraraRum       = "Demerara Rum"
    case cachaca           = "Cachaca"
    case VSOPCognac        = "VSOP Cognac"
    
    
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
}
