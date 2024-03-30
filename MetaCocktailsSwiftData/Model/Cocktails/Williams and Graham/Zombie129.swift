//
//  Zombie129.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var zombie129 = Cocktail(cocktailName: "Zombie 129",
                         imageAsset: nil,
                         glasswareType: .tikiMug,
                         garnish: [.pineappleFronds],
                         ice: .pebbleIce,
                         author: justWnG,
                         spec: zombie129Spec,
                         buildOrder: zombie129Build,
                         tags: zombie129Tags,
                         variation: nil,
                         collection: .williamsAndGraham)

let zombie129Spec  = [CocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                      CocktailIngredient(.juices(.lemon), value: 0.5),
                      CocktailIngredient(.syrups(.simple), value: 0.25),
                      CocktailIngredient(.syrups(.passionfruitSyrup), value: 0.5),
                      CocktailIngredient(.otherAlcohol(.absinthe), value: 5, unit: .sprays),
                      CocktailIngredient(.otherNonAlc(.cream), value: 0.5),
                      CocktailIngredient(.rums(.rumBlackStrap), value: 0.25),
                      CocktailIngredient(.rums(.plantationPineapple), value: 2),
                      CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .sprays),]


let zombie129Tags = Tags(profiles: [.complex, .fruity, .punchy],
                         styles: [.sour, .shaken, .tiki])

let zombie129Build = Build(instructions: [Instruction(step: 1, method: "Put all ingredients, except for the bitters and absinthe, in a tin and shake with ice."),
                                          Instruction(step: 2, method: "Strain into a tiki mug that's been rinsed with absinthe and add pebble ice."),
                                          Instruction(step: 3, method: "Garnish with pineapple fronds and finish with a spray of Angostura bitters on top of the cocktail.")])
