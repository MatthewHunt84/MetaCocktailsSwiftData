//
//  OldPal(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var oldPalWnG  =  Cocktail(cocktailName: "Old Pal (W&G Version)",
                           glasswareType: .coupe,
                           garnish: [.lemonPeel],
                           ice: nil,
                           author: williamsAndGraham,
                           spec: oldPalSpecWnG,
                           buildOrder: nil,
                           tags: oldPalTags,
                           variation: .oldPal,
                           collection: .williamsAndGraham)

var oldPalSpecWnG = [OldCocktailIngredient(.whiskies(.pendletonRye), value: 1),
                     OldCocktailIngredient(.fortifiedWines(.dolinDry), value: 1),
                     OldCocktailIngredient(.amari(.campari), value: 1)]

var oldPalTagsWnG = Tags(flavors: [.orange, .bakingSpices],
                         profiles: [.bittersweet, .spiritForward, .rich],
                         styles: [.negroni, .stirred])

