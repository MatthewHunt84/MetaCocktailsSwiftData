//
//  OaxacanOldFashioned(WnG).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var oaxacaOldFashionedWnG = Cocktail(cocktailName: "Oaxaca Old Fashioned(W&G)",
                                     glasswareType: .doubleOld,
                                     garnish: [.orangePeel],
                                     ice: .bigRock,
                                     author: williamsAndGraham,
                                     spec: oaxacaOldFashionedSpecWnG,
                                     tags: oaxacaOldFashionedTags)

var oaxacaOldFashionedSpecWnG  = [CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                                  CocktailIngredient(.bitters(.chocolateMole), value: 1, unit: .dashes),
                                  CocktailIngredient(.syrups(.agaveSyrup), value: 1, unit: .barSpoon),
                                  CocktailIngredient(.agaves(.mezcalDelMagueyVida), value: 0.5),
                                  CocktailIngredient(.agaves(.tequilaFortalezaRepo), value: 1.5)]

