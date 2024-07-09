//
//  SingaporeSling(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var singaporeSlingWnG = Cocktail(cocktailName: "Singapore Sling (W&G Version)",
                                 glasswareType: .collins,
                                 garnish: [.limeWheel, .maraschinoCherry],
                                 ice: .columnIce,
                                 author: nil,
                                 spec: singaporeSlingSpecWnG,
                                 buildOrder: nil,
                                 tags: singaporeSlingTagsWnG,
                                 variation: .singaporeSling,
                                 collection: .williamsAndGraham)

var singaporeSlingSpecWnG  = [OldCocktailIngredient(.soda(.sparklingWater), value: 2),
                             OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                             OldCocktailIngredient(.juices(.lime), value: 0.75),
                             OldCocktailIngredient(.liqueurs(.luxardoCherry), value: 0.75),
                             OldCocktailIngredient(.liqueurs(.benedictine), value: 0.75),
                             OldCocktailIngredient(.gins(.fordsGin), value: 0.75)]

var singaporeSlingTagsWnG = Tags(profiles: [.herbal, .refreshing, .light, .dry],
                                styles: [.sour, .built])

