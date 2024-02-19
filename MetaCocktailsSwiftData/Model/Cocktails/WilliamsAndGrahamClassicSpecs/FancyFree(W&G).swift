//
//  FancyFree(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var fancyFreeWnG = Cocktail(cocktailName: "Fancy Free(W&G Version)",
                            glasswareType: .doubleOld,
                            garnish: [.orangePeel],
                            ice: .bigRock,
                            author: williamsAndGraham,
                            spec: fancyFreeWnGSpec,
                            tags: fancyFreeTags,
                            variation: .fancyFree)

var fancyFreeWnGSpec     =  [CocktailIngredient(.bitters(.orangeBitters), value: 4, unit: .dash),
                             CocktailIngredient(.bitters(.angosturaBitters), value: 3, unit: .dash),
                             CocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.5),
                             CocktailIngredient(.whiskies(.fourRosesYellowLabel), value: 2)]
