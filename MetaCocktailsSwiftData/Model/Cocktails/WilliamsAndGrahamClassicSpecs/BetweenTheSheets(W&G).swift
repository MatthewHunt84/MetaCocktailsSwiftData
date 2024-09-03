//
//  BetweenTheSheets(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var betweenTheSheetsWnG  = Cocktail(cocktailName: "Between the Sheets (W&G Version)",
                                    glasswareType: .martini,
                                    garnish: [.orangeAndLemon],
                                    author: williamsAndGraham,
                                    spec: betweenTheSheetsWnGSpec,
                                    tags: betweenTheSheetsTags,
                                    variation: .betweenTheSheets,
                                    collection: .williamsAndGraham)

var betweenTheSheetsWnGSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.25),
                                OldCocktailIngredient(.liqueurs(.cointreau), value: 1),
                                OldCocktailIngredient(.brandies(.pFAmber), value: 1),
                                OldCocktailIngredient(.rums(.plantationBarbados) , value: 1)]
