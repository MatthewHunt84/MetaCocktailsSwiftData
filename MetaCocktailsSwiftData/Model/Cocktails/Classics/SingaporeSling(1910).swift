//
//  SingaporeSling(1910).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var singaporeSling = Cocktail(cocktailName: "Singapore Sling",
                              glasswareType: .collins,
                              ice: .koldDraft,
                              author: nil,
                              spec: singaporeSlingSpec,
                              buildOrder: nil,
                              tags: singaporeSlingTags,
                              variation: .singaporeSling,
                              collection: .originals,
                              titleCocktail: true)

var singaporeSlingSpec  = [OldCocktailIngredient(.soda(.sparklingWater), value: 2),
                          OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                          OldCocktailIngredient(.juices(.lime), value: 0.5),
                          OldCocktailIngredient(.liqueurs(.cherryHeering), value: 0.5),
                          OldCocktailIngredient(.liqueurs(.benedictine), value: 0.5),
                          OldCocktailIngredient(.gins(.ginAny), value: 1.5)]

var singaporeSlingTags = Tags(profiles: [.herbal, .refreshing, .light, .dry],
                             styles: [.sour, .built])

