//
//  RustyNail(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var RustyNailWnG = Cocktail(cocktailName: "Rusty Nail" + wAndGTitleTag,
                            glasswareType: .doubleOld,
                            garnish: [.lemonPeel,],
                            ice: .bigRock,
                            author: williamsAndGraham,
                            spec: RustyNailSpecWnG,
                            tags: RustyNailTagsWnG,
                            variation: .rustyNail,
                            collection: .williamsAndGraham)

var RustyNailSpecWnG     =  [OldCocktailIngredient(.liqueurs(.drambuie), value: 0.5),
                             OldCocktailIngredient(.whiskies(.balvinieDW), value: 2.5)]

var RustyNailTagsWnG     = Tags(flavors: [.lemon],
                                profiles: [.spiritForward, .punchy],
                                styles: [.oldFashioned, .stirred])
