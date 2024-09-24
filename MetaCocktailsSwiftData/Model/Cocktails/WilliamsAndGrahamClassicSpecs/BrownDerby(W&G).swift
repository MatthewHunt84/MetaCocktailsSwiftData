//
//  BrownDerby(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

let brownDerbyWnG = Cocktail(cocktailName: "Brown Derby" + wAndGTitleTag,
                             glasswareType: .doubleOld,
                             garnish: [.grapefruitPeel],
                             ice: .bigRock, 
                             author: williamsAndGraham,
                             spec: brownDerbyWnGSpec,
                             tags: brownDerbyBourbonTags,
                             variation: .brownDerby,
                             collection: .williamsAndGraham)

var brownDerbyWnGSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.whiskies(.fourRosesYellowLabel), value: 2),
                                               OldCocktailIngredient(.juices(.grapefruit), value: 0.75),
                                               OldCocktailIngredient(.syrups(.honeySyrup), value: 0.75, prep: PrepBible.honeySyrup)]



