//
//  SingaporeSling(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var singaporeSlingWnG = Cocktail(cocktailName: "Singapore Sling(W&G version)",
                                 glasswareType: .collins,
                                 garnish: [.limeWheel, .maraschinoCherry],
                                 ice: .columnIce,
                                 author: nil,
                                 spec: singaporeSlingSpecWnG,
                                 buildOrder: nil,
                                 tags: singaporeSlingTagsWnG,
                                 variation: .singaporeSling,
                                 collection: .williamsAndGraham)

var singaporeSlingSpecWnG  = [CocktailIngredient(.soda(.sparklingWater), value: 2),
                             CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dash),
                             CocktailIngredient(.juices(.lime), value: 0.75),
                             CocktailIngredient(.liqueurs(.luxardoCherry), value: 0.75),
                             CocktailIngredient(.liqueurs(.benedictine), value: 0.75),
                             CocktailIngredient(.gins(.fordsGin), value: 0.75)]

var singaporeSlingTagsWnG = Tags(profiles: [.herbal, .refreshing, .light, .dry],
                                styles: [.sour, .built])

