//
//  OaxacanOldFashioned(WnG).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var oaxacaOldFashionedWnG = Cocktail(cocktailName: "Oaxaca Old Fashioned" + wAndGTitleTag,
                                     glasswareType: .doubleOld,
                                     garnish: [.orangePeel],
                                     ice: .bigRock,
                                     author: williamsAndGraham,
                                     spec: oaxacaOldFashionedSpecWnG,
                                     tags: oaxacaOldFashionedTags,
                                     variation: .oaxacaOldFashioned,
                                     collection: .williamsAndGraham)

var oaxacaOldFashionedSpecWnG  = [OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                                  OldCocktailIngredient(.bitters(.chocolateMole), value: 1, unit: .dashes),
                                  OldCocktailIngredient(.syrups(.agaveSyrup), value: 1, unit: .barSpoon, prep: PrepBible.agaveSyrup),
                                  OldCocktailIngredient(.agaves(.mezcalDelMagueyVida), value: 0.5),
                                  OldCocktailIngredient(.agaves(.tequilaFortalezaRepo), value: 1.5)]

