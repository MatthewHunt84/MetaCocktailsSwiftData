//
//  Grasshopper(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/27/24.
//

import Foundation

var grasshopperWnG = Cocktail(cocktailName: "Grasshopper" + wAndGTitleTag,
                              glasswareType: Glassware.coupe,
                              garnish: [.mintLeaf],
                              ice: nil,
                              author: williamsAndGraham,
                              spec: grasshopperWnGSpec,
                              tags: grasshopperTags,
                              variation: .grasshopper,
                              collection: .williamsAndGraham)

var grasshopperWnGSpec = [OldCocktailIngredient(.otherNonAlc(.cream), value: 1),
                          OldCocktailIngredient(.liqueurs(.cremeDeCacao), value: 1),
                          OldCocktailIngredient(.amari(.fernetBrancaMenta), value: 1),
                          OldCocktailIngredient(.herbs(.mint), value: 4, unit: .gentlyMuddled)]
