//
//  Bamboo(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var bambooWnG = Cocktail(cocktailName: "Bamboo (Williams and Graham spec.)",
                         imageAsset: nil,
                         glasswareType: Glassware.coupe,
                         garnish: [.orangePeel],
                         ice: nil,
                         author: Author(person: "Louis Eppinger"),
                         spec: bambooWnGSpec,
                         buildOrder: nil,
                         tags: bambooTags)

var bambooWnGSpec = [CocktailIngredient(.fortifiedWines(.amontillado), value: 1.5),
                     CocktailIngredient(.fortifiedWines(.dryVermouthAny), value: 1.5),
                     CocktailIngredient(.bitters(.orangeBitters), value: 1, unit: .dash),
                     CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dash)]
