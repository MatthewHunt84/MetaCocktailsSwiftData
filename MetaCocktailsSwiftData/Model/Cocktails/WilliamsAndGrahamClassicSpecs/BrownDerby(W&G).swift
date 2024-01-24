//
//  BrownDerby(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

let brownDerbyWnG = Cocktail(cocktailName: "Brown Derby (Williams & Graham spec.)",
                             glasswareType: .doubleOld,
                             garnish: [.grapefruitPeel],
                             ice: .bigRock,
                             spec: brownDerbyWnGSpec,
                             tags: brownDerbyBourbonTags)

var brownDerbyWnGSpec: [CocktailIngredient] = [CocktailIngredient(.whiskies(.fourRosesYellowLabel), value: 2),
                                               CocktailIngredient(.juices(.grapefruit), value: 0.75),
                                               CocktailIngredient(.syrups(.honeySyrup), value: 0.75)]



