//
//  SingaporeSling(1910).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var singaporeSling = Cocktail(cocktailName: "Singapore Sling(1910s version)",
                             glasswareType: .collins,
                             ice: .koldDraft,
                             author: nil,
                             spec: singaporeSlingSpec,
                             buildOrder: nil,
                             tags: singaporeSlingTags)

var singaporeSlingSpec  = [CocktailIngredient(.soda(.sparklingWater), value: 2),
                          CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dash),
                          CocktailIngredient(.juices(.lime), value: 0.5),
                          CocktailIngredient(.liqueurs(.cherryHeering), value: 0.5),
                          CocktailIngredient(.liqueurs(.benedictine), value: 0.5),
                          CocktailIngredient(.gins(.ginAny), value: 1.5)]

var singaporeSlingTags = Tags(profiles: [.herbal, .refreshing, .light, .dry],
                             styles: [.sour, .built])

