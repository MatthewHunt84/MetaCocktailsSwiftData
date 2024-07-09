//
//  FancyFree(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var fancyFreeWnG = Cocktail(cocktailName: "Fancy Free (W&G Version)",
                            glasswareType: .doubleOld,
                            garnish: [.orangePeel],
                            ice: .bigRock,
                            author: williamsAndGraham,
                            spec: fancyFreeWnGSpec,
                            tags: fancyFreeTags,
                            variation: .fancyFree,
                            collection: .williamsAndGraham)

var fancyFreeWnGSpec     =  [OldCocktailIngredient(.bitters(.orangeBitters), value: 4, unit: .dashes),
                             OldCocktailIngredient(.bitters(.angosturaBitters), value: 3, unit: .dashes),
                             OldCocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.5),
                             OldCocktailIngredient(.whiskies(.fourRosesYellowLabel), value: 2)]
