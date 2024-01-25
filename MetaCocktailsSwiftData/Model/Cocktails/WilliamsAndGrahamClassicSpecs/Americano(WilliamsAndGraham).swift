//
//  Americano(WilliamsAndGraham).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation


var americanoWnG  = Cocktail(cocktailName: "Americano (Williams & Graham spec.)",
                             glasswareType: .collins,
                             garnish: [.orangePeel],
                             ice: .koldDraft,
                             author: Author(person: "Emile Lefeuvre", place: "Paris", year: "1889"),
                             spec: americanoWnGSpec,
                             tags: americanoWnGTags)

var americanoWnGSpec  = [CocktailIngredient(.soda(.sodaWater), value: 2),
                         CocktailIngredient(.fortifiedWines(.carpanoAntica), value: 1.5),
                         CocktailIngredient(.amari(.campari), value: 1.5)]



var americanoWnGTags   = Tags(profiles: [.bittersweet, .refreshing, .light, .effervescent],
                              styles: [.fizz, .built])

