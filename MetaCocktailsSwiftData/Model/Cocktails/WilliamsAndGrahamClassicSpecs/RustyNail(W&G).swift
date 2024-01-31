//
//  RustyNail(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var RustyNailWnG = Cocktail(cocktailName: "Rusty Nail(W&G Version)",
                            glasswareType: .doubleOld,
                            garnish: [.lemonPeel,],
                            author: williamsAndGraham,
                            spec: robRoySpecWnG,
                            tags: robRoyTagsWnG)

var RustyNailSpecWnG     =  [CocktailIngredient(.liqueurs(.drambuie), value: 0.5),
                             CocktailIngredient(.whiskies(.balvinieDW), value: 2.5)]

var RustyNailTagsWnG     = Tags(profiles: [.spiritForward, .punchy],
                                styles: [.oldFashioned, .stirred])
