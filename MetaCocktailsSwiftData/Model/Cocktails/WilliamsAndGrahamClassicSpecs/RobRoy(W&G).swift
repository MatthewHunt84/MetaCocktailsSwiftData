//
//  RobRoy(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var robRoyWnG = Cocktail(cocktailName: "Rob Roy (W&G Version)",
                         glasswareType: .nickAndNora,
                         garnish: [.maraschinoCherry, .orangeExpress],
                         author: williamsAndGraham,
                         spec: robRoySpecWnG,
                         tags: robRoyTagsWnG,
                         variation: .manhattan,
                         collection: .williamsAndGraham)

var robRoySpecWnG     =  [OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                          OldCocktailIngredient(.fortifiedWines(.cocchiDeTorino), value: 1),
                          OldCocktailIngredient(.whiskies(.glenfiddich12), value: 2)]

var robRoyTagsWnG     = Tags(flavors: [.orange],
                             profiles: [.spiritForward, .punchy, .fruity],
                             styles: [.manhattan, .stirred])
