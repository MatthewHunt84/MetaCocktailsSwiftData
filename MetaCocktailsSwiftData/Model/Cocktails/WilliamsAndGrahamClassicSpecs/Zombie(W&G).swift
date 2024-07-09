//
//  Zombie(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var zombieWnG = Cocktail(cocktailName: "Zombie (W&G Version)",
                         imageAsset: nil,
                         glasswareType: .tikiMug,
                         garnish: [.mintSprig],
                         ice: .pebbleIce,
                         author: williamsAndGraham,
                         spec: zombieSpecWnG,
                         tags: zombieTagsWnG,
                         variation: .zombie,
                         collection: .williamsAndGraham)

let zombieSpecWnG  = [OldCocktailIngredient(.juices(.lime), value: 0.75),
                      OldCocktailIngredient(.juices(.grapefruit), value: 0.5),
                      OldCocktailIngredient(.syrups(.cinnamonSyrup), value: 0.25),
                      OldCocktailIngredient(.syrups(.grenadine), value: 1, unit: .barSpoon),
                      OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                      OldCocktailIngredient(.otherAlcohol(.absinthe), value: 2, unit: .sprays),
                      OldCocktailIngredient(.rums(.havanaClubAnjeo), value: 1.5),
                      OldCocktailIngredient(.rums(.appletonEstateSignatureBlend), value: 1.5),
                      OldCocktailIngredient(.rums(.lemonHeart151), value: 1)]


let zombieTagsWnG = Tags(profiles: [.complex, .fruity, .punchy],
                         styles: [.sour, .shaken, .tiki])

