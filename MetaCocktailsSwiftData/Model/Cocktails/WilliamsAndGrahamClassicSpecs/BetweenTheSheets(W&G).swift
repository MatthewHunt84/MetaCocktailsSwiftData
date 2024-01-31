//
//  BetweenTheSheets(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var betweenTheSheetsWnG  = Cocktail(cocktailName: "Between the Sheets(W&G Version)",
                                    glasswareType: .martini,
                                    garnish: [.orangeAndLemon],
                                    author: williamsAndGraham,
                                    spec: betweenTheSheetsWnGSpec,
                                    tags: betweenTheSheetsTags)

var betweenTheSheetsWnGSpec  = [CocktailIngredient(.juices(.lemon), value: 0.25),
                                CocktailIngredient(.rums(.rumWhite), value: 1),
                                CocktailIngredient(.brandies(.pFAmber), value: 1),
                                CocktailIngredient(.rums(.plantationBarbados) , value: 1)]
