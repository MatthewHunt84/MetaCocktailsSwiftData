//
//  HistoricSpec.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 10/13/24.
//

import Foundation

enum HistoricSpec: Codable {
    
    case algonquin
    case alaska
    case betweenTheSheets
    case bloodAndSand
    case bramble
    case bobbyBurns
    case chocolateCocktail
    case elDiablo
    case fogCutter
    case ginFizz
    case silverFizz
    case hotToddy
    case mexicanFiringSquad
    case modernCocktail
   
    
    var recommendedSpec: String {
        switch self {
        case .algonquin:
            "Algonquin" + wAndGTitleTag
        case .alaska:
            "Alaska Cocktail" + wAndGTitleTag
        case .betweenTheSheets:
            "Between the Sheets" + houseTag
        case .bloodAndSand:
            "Blood & Sand" + wAndGTitleTag
        case .bramble:
            "Bramble" + houseTag
        case .bobbyBurns:
            "Bobby Burns" + houseTag
        case .chocolateCocktail:
            "Chocolate Cocktail" + wAndGTitleTag
        case .elDiablo:
            "El Diablo" + wAndGTitleTag
        case .fogCutter:
            "Fog Cutter" + wAndGTitleTag
        case .ginFizz:
            "Gin Fizz" + wAndGTitleTag
        case .silverFizz:
            "Silver Gin Fizz" + houseTag
        case .hotToddy:
            "Hot Toddy (Morgenthaler’s)"
        case .mexicanFiringSquad:
            "Mexican Firing Squad" + houseTag
        case .modernCocktail:
            "Modern Cocktail" + wAndGTitleTag
        }
    }
}
