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
                         tags: zombie129Tags)

let zombie129Spec  = [CocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                      CocktailIngredient(.juices(.lemon), value: 0.5),
                      CocktailIngredient(.syrups(.simple), value: 0.25),
                      CocktailIngredient(.syrups(.passionfruitSyrup), value: 0.5),
                      CocktailIngredient(.otherAlcohol(.absinthe), value: 2, unit: .glassRinse),
                      CocktailIngredient(.otherNonAlc(.cream), value: 0.5),
                      CocktailIngredient(.rums(.rumBlackStrap), value: 0.25),
                      CocktailIngredient(.rums(.plantationPineapple), value: 2),
                      CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .spritzOnTop),]


let zombie129Tags = Tags(profiles: [.complex, .fruity, .punchy],
                         styles: [.sour, .shaken, .tiki])

