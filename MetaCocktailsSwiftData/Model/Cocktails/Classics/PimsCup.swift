//
//  PimsCup.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var pimmsCup = Cocktail(cocktailName: "Pimms Cup",
                        glasswareType: .collins,
                        garnish: [.seasonalBerries, .mintSprig],
                        ice: .pebbleIce,
                        author: williamsAndGraham,
                        spec: pimsCupSpec,
                        notes: pimmsCupNote,
                        tags: pimsCupTags,
                        variation: .pimsCup,
                        collection: .williamsAndGraham)

let pimsCupSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.fruit(.seasonalBerries), value: 4, unit: .muddled),
                                            OldCocktailIngredient(.syrups(.gingerSyrup), value: 0.5, prep: PrepBible.gingerSyrup),
                                            OldCocktailIngredient(.syrups(.cucumberSyrup), value: 0.5, prep: PrepBible.cucumberSyrup),
                                            OldCocktailIngredient(.juices(.lemon), value: 1),
                                            OldCocktailIngredient(.gins(.fordsGin), value: 1),
                                            OldCocktailIngredient(.liqueurs(.pimms), value: 2)]

let pimsCupTags = Tags(flavors: [.mint, .blackberry, .raspberry, .strawberry],
                       profiles: [.refreshing, .complex, .fruity, .restorative],
                       styles: [.sour, .shaken])

