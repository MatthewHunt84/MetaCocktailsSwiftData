//
//  BetweenTheSheets(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var betweenTheSheetsWnG  = Cocktail(cocktailName: "Between the Sheets (Williams and Graham spec.)",
                                    glasswareType: .martini,
                                    garnish: [.orangeAndLemon],
                                    author: Author(person: AuthorNames.harryCraddock.rawValue, place: AuthorPlaces.savoy.rawValue, year: "1929"),
                                    spec: betweenTheSheetsWnGSpec,
                                    tags: betweenTheSheetsTags)

var betweenTheSheetsWnGSpec  = [CocktailIngredient(.juices(.lemon), value: 0.25),
                                CocktailIngredient(.rums(.rumWhite), value: 1),
                                CocktailIngredient(.brandies(.pFAmber), value: 1),
                                CocktailIngredient(.rums(.plantationBarbados) , value: 1)]
