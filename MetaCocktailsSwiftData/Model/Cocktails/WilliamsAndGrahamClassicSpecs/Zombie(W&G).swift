//
//  Zombie(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var zombieWnG = Cocktail(cocktailName: "Zombie(W&G version)",
                         imageAsset: nil,
                         glasswareType: .tikiMug,
                         garnish: [.mintSprig],
                         ice: .pebbleIce,
                         author: williamsAndGraham,
                         spec: zombieSpecWnG,
                         tags: zombieTagsWnG)

let zombieSpecWnG  = [CocktailIngredient(.juices(.lime), value: 0.75),
                      CocktailIngredient(.juices(.grapefruit), value: 0.5),
                      CocktailIngredient(.syrups(.cinnamonSyrup), value: 0.25),
                      CocktailIngredient(.syrups(.grenadine), value: 1, unit: .barSpoon),
                      CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dash),
                      CocktailIngredient(.otherAlcohol(.absinthe), value: 2, unit: .sprays),
                      CocktailIngredient(.rums(.havanaClubAnjeo), value: 1.5),
                      CocktailIngredient(.rums(.appletonEstateSignatureBlend), value: 1.5),
                      CocktailIngredient(.rums(.lemonHeart151), value: 1)]


let zombieTagsWnG = Tags(profiles: [.complex, .fruity, .punchy],
                         styles: [.sour, .shaken, .tiki])

