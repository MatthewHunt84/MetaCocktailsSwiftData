//
//  OldFashioned(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var oldFashionedWnG = Cocktail(cocktailName: "Old Fashioned(W&G Version)",
                               glasswareType: .doubleOld,
                               garnish: [.lemonPeel],
                               ice: .bigRock,
                               author: williamsAndGraham,
                               spec: oldFashionedSpec,
                               buildOrder: oldFashionedWGBuild,
                               tags: oldFashionedTags,
                               variation: .oldFashioned,
                               collection: .williamsAndGraham)

var oldFashionedSpecWnG  =  [CocktailIngredient(.otherNonAlc(.sugarCube), value: 1, unit: .muddled),
                             CocktailIngredient(.soda(.sodaWater), value: 1, unit: .splash),
                             CocktailIngredient(.bitters(.angosturaBitters), value: 3, unit: .dashes),
                             CocktailIngredient(.whiskies(.jimBeamRye), value: 2)]

var oldFashionedTagsWnG = Tags( profiles: [.bittersweet, .spiritForward],
                                styles: [.oldFashioned, .stirred])


var oldFashionedWGBuild = Build(instructions: [Instruction(step: 1, method: "Add bitters, sugar cube, and a splash of soda into a double old fashioned glass and muddle. The soda is just to break down the sugar cube"),
                                               Instruction(step: 2, method: "Add the whiskey, lemon expression, and lemon peel into the glass."),
                                               Instruction(step: 3, method: "Then, with the back end of a barspoon, giude a large rock into the glass so that it doesn't make a splash and stir.")])
