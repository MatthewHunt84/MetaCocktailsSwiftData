//
//  BrownDerby(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

let brownDerbyWnG = Cocktail(cocktailName: "Brown Derby(W&G Version)",
                             glasswareType: .doubleOld,
                             garnish: [.grapefruitPeel],
                             ice: .bigRock, 
                             author: williamsAndGraham,
                             spec: brownDerbyWnGSpec,
                             tags: brownDerbyBourbonTags,
                             variation: .brownDerby)

var brownDerbyWnGSpec: [CocktailIngredient] = [CocktailIngredient(.whiskies(.fourRosesYellowLabel), value: 2),
                                               CocktailIngredient(.juices(.grapefruit), value: 0.75),
                                               CocktailIngredient(.syrups(.honeySyrup), value: 0.75, prep: PrepBible.honeySyrup)]



