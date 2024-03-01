//
//  Grasshopper(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/27/24.
//

import Foundation

var grasshopperWnG = Cocktail(cocktailName: "Grasshopper(W&G Version)",
                              imageAsset: nil,
                              glasswareType: Glassware.coupe,
                              garnish: [.mintLeaf],
                              ice: nil,
                              author: williamsAndGraham,
                              spec: grasshopperWnGSpec,
                              tags: grasshopperTags,
                              variation: .grasshopper,
                              collection: .williamsAndGraham)

var grasshopperWnGSpec = [CocktailIngredient(.otherNonAlc(.cream), value: 1),
                          CocktailIngredient(.liqueurs(.cremeDeCacao), value: 1),
                          CocktailIngredient(.amari(.fernetBrancaMenta), value: 1),
                          CocktailIngredient(.herbs(.mint), value: 4, unit: .none)]
