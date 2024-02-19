//
//  Bamboo(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var bambooWnG = Cocktail(cocktailName: "Bamboo(W&G Version)",
                         imageAsset: nil,
                         glasswareType: Glassware.coupe,
                         garnish: [.orangePeel],
                         ice: nil,
                         author: williamsAndGraham,
                         spec: bambooWnGSpec,
                         buildOrder: nil,
                         tags: bambooTags,
                         variation: .bamboo)

var bambooWnGSpec = [CocktailIngredient(.fortifiedWines(.amontillado), value: 1.5),
                     CocktailIngredient(.fortifiedWines(.dryVermouthAny), value: 1.5),
                     CocktailIngredient(.bitters(.orangeBitters), value: 1, unit: .dash),
                     CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dash)]
