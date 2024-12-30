//
//  Zombie129.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var zombie129 = Cocktail(cocktailName: "Zombie 129",
                         glasswareType: .tikiMug,
                         garnish: [.pineappleFronds],
                         ice: .pebbleIce,
                         author: Author(person: AuthorNames.tomLagae.rawValue,
                                        place: AuthorPlaces.williamsAndGraham.rawValue),
                         spec: zombie129Spec,
                         buildOrder: zombie129Build,
                         tags: zombie129Tags,
                         variation: .zombie,
                         collection: .williamsAndGraham)

let zombie129Spec  = [OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                      OldCocktailIngredient(.juices(.lemon), value: 0.5),
                      OldCocktailIngredient(.syrups(.simple), value: 0.25, prep: PrepBible.simpleSyrupPrep),
                      OldCocktailIngredient(.syrups(.passionfruitSyrup), value: 0.5, prep: PrepBible.passionfruitSyrupPrep),
                      OldCocktailIngredient(.otherAlcohol(.absinthe), value: 5, unit: .sprays),
                      OldCocktailIngredient(.otherNonAlc(.cream), value: 0.5),
                      OldCocktailIngredient(.rums(.rumBlackStrap), value: 0.25),
                      OldCocktailIngredient(.rums(.plantationPineapple), value: 2),
                      OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .sprays),]


let zombie129Tags = Tags(profiles: [.complex, .fruity, .punchy],
                         styles: [.sour, .shaken, .tiki])


