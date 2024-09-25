//
//  ElPresidente(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var elPresidenteWnG  = Cocktail(cocktailName: "El Presidente" + wAndGTitleTag,
                                glasswareType: .coupe,
                                garnish: [.orangePeel],
                                ice: nil,
                                author: williamsAndGraham,
                                spec: elPresidenteSpecWnG,
                                tags: elPresidenteTags,
                                variation: .elPresidente,
                                collection: .williamsAndGraham)

var elPresidenteSpecWnG  = [OldCocktailIngredient(.rums(.plantation3Star), value: 2),
                            OldCocktailIngredient(.fortifiedWines(.dolinDry), value: 1),
                            OldCocktailIngredient(.liqueurs(.orangeCuracao) , value: 1, unit: .barSpoon),
                            OldCocktailIngredient(.syrups(.grenadine), value: 1, unit: .barSpoon, prep: PrepBible.grenadine)]

