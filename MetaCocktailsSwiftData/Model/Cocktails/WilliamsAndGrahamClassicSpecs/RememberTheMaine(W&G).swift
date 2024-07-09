//
//  RememberTheMain (W&G Version).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var rememberTheMaineWnG = Cocktail(cocktailName: "Remember The Maine (W&G Version)",
                                   glasswareType: .coupe,
                                   garnish: [.maraschinoCherry],
                                   author: williamsAndGraham,
                                   spec: manhattanSpec,
                                   tags: manhattanTags,
                                   variation: .rememberTheMaine,
                                   collection: .williamsAndGraham)

var rememberTheMaineSpecWnG     =  [OldCocktailIngredient(.otherAlcohol(.absinthe), value: 4, unit: .dashes),
                                    OldCocktailIngredient(.liqueurs(.luxardoCherry), value: 0.25),
                                    OldCocktailIngredient(.fortifiedWines(.carpanoAntica), value: 0.75),
                                    OldCocktailIngredient(.whiskies(.jimBeamRye), value: 2)]

var rememberTheMaineTagsWnG     = Tags(profiles: [.spiritForward, .bittersweet, .complex],
                                       styles: [.manhattan, .stirred])

