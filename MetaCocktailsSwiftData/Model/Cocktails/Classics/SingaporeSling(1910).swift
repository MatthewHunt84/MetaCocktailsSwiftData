//
//  SingaporeSling(1910).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var singaporSling = Cocktail(cocktailName: "Singapore Sling(1910s version)",
                             glasswareType: .collins,
                             ice: .koldDraft,
                             author: nil,
                             spec: singaporSlingSpec,
                             buildOrder: nil,
                             tags: singaporSlingTags)

var singaporSlingSpec  = [CocktailIngredient(.soda(.sparklingWater), value: 2),
                          CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dash),
                          CocktailIngredient(.juices(.lime), value: 0.5),
                          CocktailIngredient(.liqueurs(.cherryHeering), value: 0.5),
                          CocktailIngredient(.liqueurs(.benedictine), value: 0.5),
                          CocktailIngredient(.gins(.ginAny), value: 1.5)]

var singaporSlingTags = Tags(profiles: [.herbal, .refreshing, .light, .dry],
                             styles: [.sour, .built])

