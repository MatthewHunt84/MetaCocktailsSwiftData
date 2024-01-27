//
//  Americano(WilliamsAndGraham).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation


var americanoWnG  = Cocktail(cocktailName: "Americano(W&G)",
                             glasswareType: .collins,
                             garnish: [.orangePeel],
                             ice: .koldDraft,
                             author: williamsAndGraham,
                             spec: americanoWnGSpec,
                             tags: americanoWnGTags)

var americanoWnGSpec  = [CocktailIngredient(.soda(.sodaWater), value: 2),
                         CocktailIngredient(.fortifiedWines(.carpanoAntica), value: 1.5),
                         CocktailIngredient(.amari(.campari), value: 1.5)]



var americanoWnGTags   = Tags(profiles: [.bittersweet, .refreshing, .light, .effervescent],
                              styles: [.fizz, .built])

