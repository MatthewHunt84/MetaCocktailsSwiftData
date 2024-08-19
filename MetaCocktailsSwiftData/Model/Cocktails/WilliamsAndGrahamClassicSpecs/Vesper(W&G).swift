//
//  Vesper(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var vesperWnG = Cocktail(cocktailName: "Vesper (W&G Version)",
                         glasswareType: .nickAndNora,
                         garnish: [.lemonPeel],
                         author: williamsAndGraham,
                         spec: vesperSpecWnG,
                         tags: vesperTagsWnG,
                         variation: .vesper,
                         collection: .williamsAndGraham)

var vesperSpecWnG     =  [OldCocktailIngredient(.fortifiedWines(.cocchiAmericano), value: 0.5),
                          OldCocktailIngredient(.vodkas(.stoli100), value: 1),
                          OldCocktailIngredient(.gins(.tanqueray), value: 1.5)]

var vesperTagsWnG    = Tags(flavors: [.lemon],
                            profiles: [.spiritForward, .dry, .bright],
                            styles: [.martini, .stirred])
