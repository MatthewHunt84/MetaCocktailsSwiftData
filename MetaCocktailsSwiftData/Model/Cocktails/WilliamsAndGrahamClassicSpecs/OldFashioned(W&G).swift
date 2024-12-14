//
//  OldFashioned(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var oldFashionedWnG = Cocktail(cocktailName: "Old Fashioned" + wAndGTitleTag,
                               glasswareType: .doubleOld,
                               garnish: [.lemonPeel],
                               ice: .bigRock,
                               author: williamsAndGraham,
                               spec: oldFashionedSpecWnG,
                               buildOrder: oldFashionedWGBuild,
                               tags: oldFashionedTagsWnG,
                               variation: .oldFashioned,
                               collection: .williamsAndGraham)

var oldFashionedSpecWnG  =  [OldCocktailIngredient(.otherNonAlc(.sugarCube), value: 1, unit: .muddled),
                             OldCocktailIngredient(.soda(.sodaWater), value: 1, unit: .splash),
                             OldCocktailIngredient(.bitters(.angosturaBitters), value: 3, unit: .dashes),
                             OldCocktailIngredient(.whiskies(.jimBeamRye), value: 2)]

var oldFashionedTagsWnG = Tags(flavors: [.lemon],
                               profiles: [.bittersweet, .spiritForward],
                               styles: [.oldFashioned, .stirred])


