//
//  WhiskeySmash.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation



var whiskeySmash = Cocktail(cocktailName: "Whiskey Smash",
                            imageAsset: nil,
                            glasswareType: .doubleOld,
                            garnish: [.mintSprig],
                            ice: .pebbleIce,
                            author: williamsAndGraham,
                            spec: whiskeySmashSpec,
                            buildOrder: whiskeySmashBuild,
                            tags: whiskeySmashTags)

let whiskeySmashSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                                                 OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                                                 OldCocktailIngredient(.herbs(.mint), value: 8, unit: .gentlyMuddled),
                                                 OldCocktailIngredient(.whiskies(.bourbonAny), value: 2)]

let whiskeySmashTags = Tags(profiles: [.light, .herbal, .refreshing, .restorative],
                            styles: [.sour, .shaken])

let whiskeySmashBuild =  Build(instructions: [Instruction(step: 1, method: "In a tin, gently muddle the mint if you don't have sizable ice cubes to do the muddling for you while shaking."),
                                              Instruction(step: 2, method: "Double strain over crushed ice."),
                                              Instruction(step: 3, method: "Garnish with mint sprig."),
                                              Instruction(step: 4, method: "Note: Use a few lemon wedges instead of the lemon juice for a more classic smash. In that case, muddle them with the mint before adding the other ingredients.")])
