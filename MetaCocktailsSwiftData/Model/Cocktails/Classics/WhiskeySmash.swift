//
//  WhiskeySmash.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation



var whiskeySmash = Cocktail(cocktailName: "Whiskey Smash",
                            glasswareType: .doubleOld,
                            garnish: [.mintSprig],
                            ice: .pebbleIce,
                            spec: whiskeySmashSpec,
                            buildOrder: whiskeySmashBuild,
                            notes: whiskeySmashNote,
                            tags: whiskeySmashTags)

let whiskeySmashSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                                                 OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                                                 OldCocktailIngredient(.herbs(.mint), value: 8, unit: .gentlyMuddled),
                                                 OldCocktailIngredient(.whiskies(.bourbonAny), value: 2)]

let whiskeySmashTags = Tags(profiles: [.light, .herbal, .refreshing, .restorative],
                            styles: [.sour, .shaken])

