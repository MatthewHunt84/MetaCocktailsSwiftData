//
//  BetweenTheSheets.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var betweenTheSheets  = Cocktail(cocktailName: "Between the Sheets" + historicTag,
                                 glasswareType: .martini,
                                 garnish: [.orangePeel],
                                 author: Author(person: AuthorNames.harryCraddock.rawValue, place: AuthorPlaces.savoy.rawValue, year: "1929"),
                                 spec: betweenTheSheetsSpec,
                                 tags: betweenTheSheetsTags,
                                 variation: .betweenTheSheets,
                                 collection: .originals,
                                 titleCocktail: true,
                                 historicSpec: .betweenTheSheets)

var betweenTheSheetsSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                             OldCocktailIngredient(.rums(.rumWhite), value: 0.75),
                             OldCocktailIngredient(.brandies(.cognacVSOP), value: 0.75),
                             OldCocktailIngredient(.liqueurs(.cointreau) , value: 0.75)]


var betweenTheSheetsTags   = Tags(flavors: [.orange],
                                  profiles: [.citrusy, .tart, .light],
                                  styles: [.shaken, .sour, .daisy])
