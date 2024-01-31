//
//  OldFashioned(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var oldFashionedWnG = Cocktail(cocktailName: "Old Fashioned",
                               glasswareType: .doubleOld,
                               garnish: [.lemonPeel],
                               ice: .bigRock,
                               author: williamsAndGraham,
                               spec: oldFashionedSpec,
                               tags: oldFashionedTags)

var oldFashionedSpecWnG  =  [CocktailIngredient(.otherNonAlc(.sugarCube), value: 1, unit: .muddled),
                             CocktailIngredient(.soda(.sodaWater), value: 1, unit: .splash),
                             CocktailIngredient(.bitters(.angosturaBitters), value: 3, unit: .dashes),
                             CocktailIngredient(.whiskies(.jimBeamRye), value: 2)]

var oldFashionedTagsWnG = Tags( profiles: [.bittersweet, .spiritForward],
                                styles: [.oldFashioned, .stirred])

