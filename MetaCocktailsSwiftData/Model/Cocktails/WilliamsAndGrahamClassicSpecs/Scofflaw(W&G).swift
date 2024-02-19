//
//  Scofflaw(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var scofflawWnG = Cocktail(cocktailName: "Scofflaw(W&G Version)",
                           glasswareType: .martini,
                           garnish: [.orangePeel],
                           ice: nil,
                           author: williamsAndGraham,
                           spec: scofflawSpecWnG,
                           buildOrder: nil,
                           tags: scofflawTagsWnG,
                           variation: .scofflaw)

var scofflawSpecWnG  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                        CocktailIngredient(.syrups(.grenadine), value: 0.75),
                        CocktailIngredient(.fortifiedWines(.dolinDry), value: 1),
                        CocktailIngredient(.whiskies(.pendletonRye), value: 2)]

var scofflawTagsWnG = Tags(profiles: [.fruity, .light, .refreshing, .citrusy],
                           styles: [.sour, .shaken])
