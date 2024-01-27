//
//  Authors.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation

enum AuthorNames: String, Codable, CaseIterable {
    
    case constante         = "Constante Ribalaiuga"
    case crosbyGaige       = "Crosby Gaige"
    case davidEmbury       = "David Embury"
    case devonTarby        = "Devon Tarby"
    case dickBradsell      = "Dick Bradsell"
    case ernestHemingway   = "Ernest Hemingway"
    case giuseppeGonzalas  = "Giuseppe Gonzalas"
    case harryCraddock     = "Harry Craddock"
    case harryJohnson      = "Harry Johnson"
    case hugoEnsslin       = "Hugo Ensslin"
    case jamesMenkal       = "James Menkal"
    case jerryThomas       = "Jerry Thomas"
    case philWard          = "Phil Ward"
    case samRoss           = "Sam Ross"
    case seanKenyon        = "Sean Kenyon"
    case sashaPetraske     = "Sasha Petraske"
    case saydeeCanada      = "Saydee Canada"
    case traderVic         = "Victor (Trader Vic) Bergeron"
    case walterBergeron    = "Walter Bergeron"
  
}
enum AuthorPlaces: String, Codable, CaseIterable {
       
    case aviaryBar                    = "Aviary Bar at the Kuala Lumpur Hilton"
    case bourbonNBranch               = "Bourbon & Branch"
    case crosbyGaigeCocktailGuide     = "Crosby Gaige's Cocktail Guide and Ladies Companion, New York"
    case deathAndCo                   = "Death & Co"
    case detroitAthleticClub          = "Detroit Athletic club"
    case fredsClubLondon              = "Fred's Club. London, Soho"
    case harryJohnsonManual           = "Harry Johnson's New and Improved Bartenders' Manual"
    case hoffmanHouse                 = "Hoffman House Bar"
    case hotelMonteleone              = "Hotel Monteleone"
    case howToMixDrinksJT             = "Jerry Thomas: How to Mix Drinks"
    case milkAndHoney                 = "Milk and Honey"
    case recipesForMixedDrinks        = "Recipes for Mixed Drinks"
    case savoy                        = "American Bar at the Savoy Hotel, London."
    case traderVicsBartendersGuide    = "Trader Vic's Bartender's Guide, Revised."
    case traderVicsBookOfFoodAndDrink = "Trader Vic's Book of Food and Drink"
    case williamsAndGraham            = "Williams and Graham. Denver, Colorado"
    
}

struct Author {
    var person: String?
    var place: String?
    var year: String?
  
}
var harryCraddock = Author(person: AuthorNames.harryCraddock.rawValue, place: AuthorPlaces.savoy.rawValue, year: "1930")
var williamsAndGraham = Author(place: AuthorPlaces.williamsAndGraham.rawValue, year: "2012")
