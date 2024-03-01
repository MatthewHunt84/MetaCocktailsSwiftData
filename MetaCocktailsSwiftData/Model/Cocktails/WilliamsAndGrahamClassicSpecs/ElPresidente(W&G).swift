//
//  ElPresidente(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var elPresidenteWnG  = Cocktail(cocktailName: "El Presidente(W&G Version)",
                                glasswareType: .coupe,
                                garnish: [.orangePeel],
                                ice: nil,
                                author: williamsAndGraham,
                                spec: elPresidenteSpecWnG,
                                tags: elPresidenteTags,
                                variation: .elPresidente,
                                collection: .williamsAndGraham)

var elPresidenteSpecWnG  = [CocktailIngredient(.rums(.plantation3Star), value: 2),
                            CocktailIngredient(.fortifiedWines(.dolinDry), value: 1),
                            CocktailIngredient(.liqueurs(.orangeCuracao) , value: 1, unit: .barSpoon),
                            CocktailIngredient(.syrups(.grenadine), value: 1, unit: .barSpoon)]

