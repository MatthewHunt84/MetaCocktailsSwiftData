//
//  PimsCup.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var pimmsCup = Cocktail(cocktailName: "Pimms Cup",
                       imageAsset: nil,
                       glasswareType: .collins,
                        garnish: [.seasonalBerries, .mintSprig],
                       ice: .pebbleIce,
                       spec: pimsCupSpec,
                       buildOrder: pimsCupBuild,
                       tags: pimsCupTags)

let pimsCupSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.fruit(.seasonalBerries), value: 4, unit: .muddled),
                                         OldCocktailIngredient(.syrups(.gingerSyrup), value: 0.5, prep: PrepBible.gingerSyrup),
                                         OldCocktailIngredient(.syrups(.cucumberSyrup), value: 0.5, prep: PrepBible.cucumberSyrup),
                                         OldCocktailIngredient(.juices(.lemon), value: 1),
                                         OldCocktailIngredient(.gins(.fordsGin), value: 1),
                                         OldCocktailIngredient(.liqueurs(.pimms), value: 2)]

let pimsCupBuild = Build(instructions: [Instruction(step: 1, method: "The original cocktail, dating somewhere around 1912, was a bottled sling called the 'Pimms No. 1 Cup'. It was kinda like what we know of today as an RTD, but without the carbonation or citrus. We now know of Pimms as the liquor that more or less resembles an Amaro. All the modern versions of this cocktail are restoritive and refreshing. I assure you, like this recipe from Williams and Graham, they're better than the original.")])

let pimsCupTags = Tags(profiles: [.refreshing, .complex, .fruity, .restorative],
                       styles: [.sour, .shaken])

