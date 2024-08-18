//
//  Authors.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import SwiftUI
import SwiftData

enum AuthorNames: String, Codable, CaseIterable {
    
    case audrySaunders     = "Audrey Saunders"
    case allisonWiddecombe = "Allison Widdecombe"
    case benLong           = "Ben Long"
    case brianMiller       = "Brian Miller"
    case carolynGil        = "Carolyn Gil"
    case constante         = "Constante Ribalaigua"
    case crosbyGaige       = "Crosby Gaige"
    case chadSolomon       = "Chad Solomon"
    case chadLarson        = "Chad Larson"
    case chadMG            = "Chad Michael George"
    case charlesBaker      = "Charles H. Baker"
    case charlesMahoney    = "Charles Mahoney"
    case christiPope       = "Christi Pope"
    case christiFelkins    = "Christi Felkins"
    case christinaAndrews  = "Christina Andrews"
    case davidEmbury       = "David Embury"
    case devonTarby        = "Devon Tarby"
    case dickBradsell      = "Dick Bradsell"
    case ernestHemingway   = "Ernest Hemingway"
    case georgeDelgado     = "George Delgado"
    case gilBouhana        = "Gil Bouhana"
    case giuseppeGonzalas  = "Giuseppe Gonzalas"
    case harryCraddock     = "Harry Craddock"
    case harryJohnson      = "Harry Johnson"
    case harryMcElhone     = "Harry McElhone"
    case hugoEnsslin       = "Hugo Ensslin"
    case jasonPatz         = "Jason Patz"
    case jamesMenkal       = "James Menkal"
    case jerryThomas       = "Jerry Thomas"
    case johnShramm        = "John Shramm"
    case joaquinSimo       = "Joaquín Simó"
    case josephSchwartz    = "Joseph Schwartz"
    case justinJenkins     = "Justin Jenkins"
    case laClarke          = "L. A. Clarke"
    case laurenMcLaughlin  = "Lauren McLaughlin"
    case laurneLowe        = "Lauren Lowe"
    case marcosTello       = "Marcos Tello"
    case mattHunt          = "Matt Hunt"
    case michaelMadrusan   = "Michael Madrusan"
    case nicoleLaurita     = "Nicole Laurita"
    case nickTouch         = "Nick Touch"
    case ohByron           = "O.H. Byron"
    case paulHarrington    = "Paul Harrington"
    case philWard          = "Phil Ward"
    case richardBoccato    = "Richard Boccato"
    case reneDominguez     = "Rene Dominguez"
    case rKFox             = "R.K. Fox"
    case samJohnson        = "Sam Johnson"
    case samRoss           = "Sam Ross"
    case seanKenyon        = "Sean Kenyon"
    case sashaPetraske     = "Sasha Petraske"
    case saydeeCanada      = "Saydee Canada"
    case stanleyArthur     = "Stanley Clisby Arthur"
    case tedSaucier        = "Ted Saucier"
    case tobyMaloney       = "Toby Maloney"
    case tomBullock        = "Tom Bullock"
    case tomLagae          = "Tom Lagae"
    case theoLieberman     = "Theo Lieberman"
    case tjSiegal          = "T.J. Siegal"
    case traderVic         = "Victor (Trader Vic) Bergeron"
    case walterBergeron    = "Walter Bergeron"
    case valarieAlvarado   = "Valarie Alvarado"
    case killian           = "Killian Hopkins"
    case jesseBowen        = "Jesse Bowen"
    case kennyRemster      = "Kenny Remster"
    case vincenzoErrico    = "Vincenzo Errico"
    case whitneyAllen      = "Whitney Allen"
    case zacharyRubin      = "Zachary Gelnaw-Rubin"
  
}

enum AuthorPlaces: String, Codable, CaseIterable, Identifiable {
       
    case abcOfMixingCocktails         = "'Harry' of Ciro's ABC of Mixing Cocktails"
    case aviaryBar                    = "Aviary Bar at the Kuala Lumpur Hilton"
    case bourbonNBranch               = "Bourbon & Branch"
    case cafeRoyalCocktialBook        = "Cafe Royal Cocktail Book (London)"
    case crosbyGaigeCocktailGuide     = "Crosby Gaige's Cocktail Guide and Ladies Companion, New York"
    case deathAndCo                   = "Death & Co"
    case detroitAthleticClub          = "Detroit Athletic club"
    case dutchKills                   = "Dutch Kills, New York"
    case ellaDiningRoom               = "Ella Dining Room, Sacramento"
    case fredsClubLondon              = "Fred's Club. London, Soho"
    case famousNewOrleansDrinks       = "Famous New Orleans Drinks and How to Mix 'Em'"
    case gentlemansCompanion          = "Gentleman's Companion"
    case harryJohnsonManual           = "Harry Johnson's New and Improved Bartenders' Manual"
    case hoffmanHouse                 = "Hoffman House Bar, New York"
    case hoffmanBartendersGuide       = "Hoffman House Bartender's Guide"
    case hotelMonteleone              = "Hotel Monteleone"
    case howToMixDrinksJT             = "Bartender's Guide: How to Mix Drinks"
    case johnDoryOysterBar            = "John Dory Oyster Bar, New York"
    case laFloridita                  = "La Floridita"
    case libation                     = "Libation, New York"
    case milkAndHoney                 = "Milk and Honey, New York"
    case peguClub                     = "Pegu Club, Soho"
    case recipesForMixedDrinks        = "Recipes for Mixed Drinks"
    case savoy                        = "American Bar at the Savoy Hotel, London"
    case traderVicsBartendersGuide    = "Trader Vic's Bartender's Guide, Revised"
    case traderVicsBookOfFoodAndDrink = "Trader Vic's Book of Food and Drink"
    case williamsAndGraham            = "Williams and Graham, Denver"
    case theFineArtOfMixingDrinks     = "The Fine Art of Mixing Drinks"
    case theVioletHour                = "The Violet Hour, Chicago"
    
    var id: String {
        rawValue
    }
    
}

struct Author:  Codable, Equatable, Identifiable {
    
    
    var id = UUID()
    var person: String?
    var place: String?
    var year: String?
}

enum FilterOption {
    
    case author(Author)
    case collection(CocktailCollection)
    
}



var harryCraddock = Author(person: AuthorNames.harryCraddock.rawValue, place: AuthorPlaces.savoy.rawValue, year: "1930")
var williamsAndGraham = Author(place: AuthorPlaces.williamsAndGraham.rawValue, year: "2023")
var justWnG = Author(place: AuthorPlaces.williamsAndGraham.rawValue)
var hugoEnsslin = Author(person: AuthorNames.hugoEnsslin.rawValue, place: AuthorPlaces.recipesForMixedDrinks.rawValue, year: "1917")
var davidEmbury = Author(person: AuthorNames.davidEmbury.rawValue, place: AuthorPlaces.theFineArtOfMixingDrinks.rawValue, year: "1948")
var jerryThomas = Author(person: AuthorNames.jerryThomas.rawValue, place: AuthorPlaces.howToMixDrinksJT.rawValue, year: "1862")
var stanleyArthur = Author(person: AuthorNames.stanleyArthur.rawValue, place: AuthorPlaces.famousNewOrleansDrinks.rawValue, year: "1937")
var traderVic1947  = Author(person: AuthorNames.traderVic.rawValue, place: AuthorPlaces.traderVicsBartendersGuide.rawValue, year: "1947")
var charlesBaker = Author(person: AuthorNames.charlesBaker.rawValue, place: AuthorPlaces.gentlemansCompanion.rawValue, year: "1939")
var oHByron = Author(person: AuthorNames.ohByron.rawValue, place: "The Modern Bartenders' Guide", year: "1884")
var sashaPetraske = Author(person: AuthorNames.sashaPetraske.rawValue, place: AuthorPlaces.milkAndHoney.rawValue, year: "Early 2000s")

