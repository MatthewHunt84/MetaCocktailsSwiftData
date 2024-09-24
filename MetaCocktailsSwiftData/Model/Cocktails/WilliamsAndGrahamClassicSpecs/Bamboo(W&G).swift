//
//  Bamboo(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var bambooWnG = Cocktail(cocktailName: "Bamboo" + wAndGTitleTag,
                         imageAsset: nil,
                         glasswareType: Glassware.coupe,
                         garnish: [.orangePeel],
                         ice: nil,
                         author: williamsAndGraham,
                         spec: bambooWnGSpec,
                         buildOrder: nil,
                         tags: bambooTags,
                         variation: .bamboo,
                         collection: .williamsAndGraham)

var bambooWnGSpec = [OldCocktailIngredient(.fortifiedWines(.amontillado), value: 1.5),
                     OldCocktailIngredient(.fortifiedWines(.dryVermouthAny), value: 1.5),
                     OldCocktailIngredient(.bitters(.orangeBitters), value: 1, unit: .dashes),
                     OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes)]
