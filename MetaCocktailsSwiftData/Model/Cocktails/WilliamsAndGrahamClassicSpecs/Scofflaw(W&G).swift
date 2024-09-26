//
//  Scofflaw(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var scofflawWnG = Cocktail(cocktailName: "Scofflaw" + wAndGTitleTag,
                           glasswareType: .martini,
                           garnish: [.orangePeel],
                           ice: nil,
                           author: williamsAndGraham,
                           spec: scofflawSpecWnG,
                           buildOrder: nil,
                           tags: scofflawTagsWnG,
                           variation: .scofflaw,
                           collection: .williamsAndGraham)

var scofflawSpecWnG  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                        OldCocktailIngredient(.syrups(.grenadine), value: 0.75, prep: PrepBible.grenadine),
                        OldCocktailIngredient(.fortifiedWines(.dolinDry), value: 1),
                        OldCocktailIngredient(.whiskies(.pendletonRye), value: 2)]

var scofflawTagsWnG = Tags(flavors: [.orange],
                           profiles: [.fruity, .light, .refreshing, .citrusy],
                           styles: [.sour, .shaken])
