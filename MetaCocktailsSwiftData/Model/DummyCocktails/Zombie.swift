//
//  Zombie.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation


var zombie = Cocktail(cocktailName: "Zombie",
                      imageAsset: nil,
                      glasswareType: .tikiMug,
                      garnish: [.mintSprig],
                      ice: .pebbleIce,
                      author: Author(person: "Don Beach", place: "Don the Beachcomber's: Hollywood, CA", year: "1934"),
                      spec: zombieSpec,
                      tags: zombieTags,
                      variation: .zombie,
                      collection: .originals,
                      titleCocktail: true)

let zombieSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.juices(.lime), value: 0.75),
                                        OldCocktailIngredient(.juices(.donsMix), value: 0.5),
                                           OldCocktailIngredient(.syrups(.grenadine), value: 1, unit: .teaspoon, prep: PrepBible.grenadine),
                                        OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                                        OldCocktailIngredient(.liqueurs(.falernum), value: 0.5),
                                        OldCocktailIngredient(.otherAlcohol(.pernod), value: 6, unit: .drops),
                                        OldCocktailIngredient(.rums(.goldJamaicanRum), value: 1.5),
                                        OldCocktailIngredient(.rums(.goldPuertoRicanRum), value: 1.5),
                                        OldCocktailIngredient(.rums(.lemonHeart151), value: 1)]


let zombieTags = Tags(flavors: [.mint],
                      profiles: [.complex, .fruity, .punchy],
                      styles: [.sour, .shaken, .blended, .tiki])

