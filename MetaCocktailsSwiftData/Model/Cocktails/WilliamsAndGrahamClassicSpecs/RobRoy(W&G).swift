//
//  RobRoy(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var robRoyWnG = Cocktail(cocktailName: "Rob Roy(W&G Version)",
                         glasswareType: .nickAndNora,
                         garnish: [.maraschinoCherry, .orangeExpress],
                         author: williamsAndGraham,
                         spec: robRoySpecWnG,
                         tags: robRoyTagsWnG,
                         variation: .robRoy,
                         collection: .williamsAndGraham)

var robRoySpecWnG     =  [CocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                          CocktailIngredient(.fortifiedWines(.cocchiDeTorino), value: 1),
                          CocktailIngredient(.whiskies(.glenfiddich12), value: 2)]

var robRoyTagsWnG     = Tags(profiles: [.spiritForward, .punchy, .fruity],
                             styles: [.manhattan, .stirred])
