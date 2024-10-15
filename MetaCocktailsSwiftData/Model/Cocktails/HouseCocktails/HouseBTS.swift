//
//  HouseBTS.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 10/14/24.
//

import Foundation

var houseBetweenTheSheets  = Cocktail(cocktailName: "Between the Sheets" + houseTag,
                                      glasswareType: .coupe,
                                      garnish: [.orangePeel],
                                      spec: houseBetweenTheSheetsSpec,
                                      tags: houseBetweenTheSheetsTags,
                                      variation: .betweenTheSheets)

var houseBetweenTheSheetsSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.5),
                                  OldCocktailIngredient(.syrups(.demSyrupOneToOne), value: 0.25),
                                  OldCocktailIngredient(.rums(.rumWhite), value: 0.75),
                                  OldCocktailIngredient(.brandies(.cognacVSOP), value: 0.75),
                                  OldCocktailIngredient(.liqueurs(.cointreau) , value: 0.75)]


var houseBetweenTheSheetsTags   = Tags(flavors: [.orange],
                                       profiles: [.citrusy, .tart, .light],
                                       styles: [.shaken, .sour, .daisy])
