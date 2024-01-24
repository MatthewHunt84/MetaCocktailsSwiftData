//
//  Authors.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation

enum AuthorNames: String, Codable, CaseIterable {
    
    case jamesMenkal       = "James Menkal"
    case samRoss           = "Sam Ross"
    case philWard          = "Phil Ward"
    case jerryThomas       = "Jerry Thomas"
    case constante         = "Constante Ribalaiuga"
    case saydeeCanada      = "Saydee Canada"
    case devonTarby        = "Devon Tarby"
    case seanKenyon        = "Sean Kenyon"
    case giuseppeGonzalas  = "Giuseppe Gonzalas"
    case sashaPetraske     = "Sasha Petraske"
    case walterBergeron    = "Walter Bergeron"
    case traderVic         = "Victor (Trader Vic) Bergeron"
    case davidEmbury       = "David Embury"
    case hugoEnsslin       = "Hugo Ensslin"
    case harryCraddock     = "Harry Craddock"
    case harryJohnson      = "Harry Johnson"
    case dickBradsell      = "Dick Bradsell"
  
}
enum AuthorPlaces: String, Codable, CaseIterable {
    
    case williamsAndGraham     = "Williams and Graham"
    case milkAndHoney          = "Milk and Honey"
    case deathAndCo            = "Death & Co"
    case aviaryBar             = "Aviary Bar at the Kuala Lumpur Hilton"
    case detroitAthleticClub   = "Detroit Athletic club"
    case fredsClubLondon       = "Fred's Club, London Soho"
    case hotelMonteleone       = "Hotel Monteleone"
    case savoy                 = "Savoy Hotel (Cocktail Book)"
    case hoffmanHouse          = "Hoffman House Bar"
    case harryJohnsonManual    = "Harry Johnson's New and Improved Bartenders' Manual"
    case bourbonNBranch        = "Bourbon & Branch"
    case howToMixDrinksJT      = "Jerry Thomas: How to Mix Drinks"
    case recipesForMixedDrinks = "Recipes for Mixed Drinks"
    
}

struct Author {
    var person: String?
    var place: String?
    var year: String?
  
}
