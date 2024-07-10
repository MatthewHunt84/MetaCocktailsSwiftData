//
//  BloodAndSand(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var bloodAndSandWnG  = Cocktail(cocktailName: "Blood & Sand (W&G Version)",
                                glasswareType: .martini,
                                garnish: [.orangePeel],
                                ice: nil,
                                author: williamsAndGraham,
                                spec: bloodAndSandWnGSpec,
                                tags: bloodAndSandTags,
                                variation: .bloodAndSand,
                                collection: .williamsAndGraham)

var bloodAndSandWnGSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.25),
                            OldCocktailIngredient(.juices(.orange), value: 0.75),
                            OldCocktailIngredient(.fortifiedWines(.carpanoAntica), value: 0.75),
                            OldCocktailIngredient(.liqueurs(.luxardoCherry), value: 0.75),
                            OldCocktailIngredient(.whiskies(.glenfiddich12), value: 0.75)]



var bloodAndSandWnGTags   = Tags(profiles: [.fruity, .sweet],
                                 styles: [.daisy, .shaken])

