//
//  BetweenTheSheets.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var betweenTheSheets  = Cocktail(cocktailName: "Between the Sheets",
                                 glasswareType: .martini,
                                 garnish: [.orangePeel],
                                 author: Author(person: "Frank Shay", place: "New York", year: "1929"),
                                 spec: betweenTheSheetsSpec,
                                 tags: betweenTheSheetsTags)

var betweenTheSheetsSpec  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                             CocktailIngredient(.rums(.rumWhite), value: 0.75),
                             CocktailIngredient(.brandies(.cognacVSOP), value: 0.75),
                             CocktailIngredient(.liqueurs(.cointreau) , value: 0.75)]


var betweenTheSheetsTags   = Tags(profiles: [.citrusy, .tart],
                                  textures: [.light],
                                  styles: [.shaken, .sour])
