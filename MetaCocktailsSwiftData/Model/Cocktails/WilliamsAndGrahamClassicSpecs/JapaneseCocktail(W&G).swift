//
//  JapaneseCocktail(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var japaneseCocktailWnG  = Cocktail(cocktailName: "Japanese Cocktail(W&G Version)",
                                    glasswareType: .stemmedGlassware,
                                    garnish: [.lemonPeel],
                                    author: williamsAndGraham,
                                    spec: japaneseCocktailSpec,
                                    tags: japaneseCocktailTags,
                                    variation: .japanese)

var japaneseCocktailSpecWnG  = [CocktailIngredient(.bitters(.angosturaBitters), value: 3, unit: .dash),
                                CocktailIngredient(.syrups(.orgeat), value: 0.5, prep: PrepBibleViewModel().orgeat),
                                CocktailIngredient(.brandies(.pFAmber) , value: 2.5)]


