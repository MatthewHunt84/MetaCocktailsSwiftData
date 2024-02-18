//
//  SingaporeSling(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var singaporSlingWnG = Cocktail(cocktailName: "Singapore Sling(W&G version)",
                                glasswareType: .collins,
                                garnish: [.limeWheel, .maraschinoCherry],
                                ice: .columnIce,
                                author: nil,
                                spec: singaporSlingSpecWnG,
                                buildOrder: nil,
                                tags: singaporSlingTagsWnG)

var singaporSlingSpecWnG  = [CocktailIngredient(.soda(.sparklingWater), value: 2),
                             CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dash),
                             CocktailIngredient(.juices(.lime), value: 0.75),
                             CocktailIngredient(.liqueurs(.luxardoCherry), value: 0.75),
                             CocktailIngredient(.liqueurs(.benedictine), value: 0.75),
                             CocktailIngredient(.gins(.fordsGin), value: 0.75)]

var singaporSlingTagsWnG = Tags(profiles: [.herbal, .refreshing, .light, .dry],
                                styles: [.sour, .built])

