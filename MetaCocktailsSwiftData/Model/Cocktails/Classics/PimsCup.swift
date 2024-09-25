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
                        author: williamsAndGraham,
                        spec: pimsCupSpec,
                        notes: pimsCupNotes,
                        tags: pimsCupTags,
                        variation: .pimsCup,
                        collection: .williamsAndGraham)

let pimsCupSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.fruit(.seasonalBerries), value: 4, unit: .muddled),
                                            OldCocktailIngredient(.syrups(.gingerSyrup), value: 0.5, prep: PrepBible.gingerSyrup),
                                            OldCocktailIngredient(.syrups(.cucumberSyrup), value: 0.5, prep: PrepBible.cucumberSyrup),
                                            OldCocktailIngredient(.juices(.lemon), value: 1),
                                            OldCocktailIngredient(.gins(.fordsGin), value: 1),
                                            OldCocktailIngredient(.liqueurs(.pimms), value: 2)]

let pimsCupNotes = "The Pimm's Cup originated around 1912 as a bottled sling called \"Pimm's No. 1 Cup\". It was similar to today's ready-to-drink cocktails, but without carbonation or citrus. Pimm's itself is now known as a liqueur resembling an amaro. Today, the Pimm's Cup is the official drink of Wimbledon. Modern versions of this cocktail are restorative and refreshing, evolving significantly from the original formula. Contemporary recipes like this one offer a more refined drinking experience, compared to the original bottled version."

let pimsCupTags = Tags(flavors: [.mint, .blackberry, .raspberry, .strawberry],
                       profiles: [.refreshing, .complex, .fruity, .restorative],
                       styles: [.sour, .shaken])

