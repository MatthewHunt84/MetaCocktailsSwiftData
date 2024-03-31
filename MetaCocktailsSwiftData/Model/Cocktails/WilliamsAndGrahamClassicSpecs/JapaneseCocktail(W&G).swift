//
//  JapaneseCocktail(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var japaneseCocktailWnG  = Cocktail(cocktailName: "Japanese Cocktail (W&G Version)",
                                    glasswareType: .stemmedGlassware,
                                    garnish: [.lemonPeel],
                                    author: williamsAndGraham,
                                    spec: japaneseCocktailSpecWnG,
                                    tags: japaneseCocktailTagsWnG,
                                    variation: .japanese,
                                    collection: .williamsAndGraham)

var japaneseCocktailSpecWnG  = [CocktailIngredient(.bitters(.angosturaBitters), value: 3, unit: .dashes),
                                CocktailIngredient(.syrups(.orgeat), value: 0.5, prep: PrepBible.orgeat),
                                CocktailIngredient(.brandies(.pFAmber) , value: 2.5)]


var japaneseCocktailTagsWnG   = Tags(profiles: [.nutty, .sweet, .spiritForward],
                                  styles: [.stirred, .oldFashioned])

