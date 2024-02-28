//
//  Zombie.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation


var zombie = Cocktail(cocktailName: "Zombie(1934)",
                      imageAsset: nil,
                      glasswareType: .tikiMug,
                      garnish: [.mintSprig],
                      ice: .pebbleIce,
                      author: Author(person: "Don Beach", place: "Don the Beachcomber's: Hollywood, CA", year: "1934"),
                      spec: zombieSpec,
                      tags: zombieTags,
                      variation: .zombie)

let zombieSpec: [CocktailIngredient] = [CocktailIngredient(.juices(.lime), value: 0.75),
                                        CocktailIngredient(.juices(.donsMix), value: 0.5),
                                        CocktailIngredient(.syrups(.grenadine), value: 1, unit: .teaspoon),
                                        CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dash),
                                        CocktailIngredient(.liqueurs(.falernum), value: 0.5),
                                        CocktailIngredient(.otherAlcohol(.pernod), value: 6, unit: .drops),
                                        CocktailIngredient(.rums(.goldJamaicanRum), value: 1.5),
                                        CocktailIngredient(.rums(.goldPuertoRicanRum), value: 1.5),
                                        CocktailIngredient(.rums(.lemonHeart151), value: 1)]


let zombieTags = Tags(profiles: [.complex, .fruity, .punchy],
                      styles: [.sour, .shaken, .blended, .tiki])

