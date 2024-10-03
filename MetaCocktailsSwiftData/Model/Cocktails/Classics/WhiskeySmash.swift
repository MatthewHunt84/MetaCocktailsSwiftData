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
                            spec: whiskeySmashSpec,
                            buildOrder: whiskeySmashBuild,
                            notes: whiskeySmashNotes,
                            tags: whiskeySmashTags)

let whiskeySmashSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                                                 OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                                                 OldCocktailIngredient(.herbs(.mint), value: 8, unit: .gentlyMuddled),
                                                 OldCocktailIngredient(.whiskies(.bourbonAny), value: 2)]

let whiskeySmashTags = Tags(profiles: [.light, .herbal, .refreshing, .restorative],
                            styles: [.sour, .shaken])

let whiskeySmashBuild =  Build(instructions: [Instruction(step: 0, method: "For a classic recipe, substitute a few lemon wedges in place of squeezed lemon juice. Then muddle them with the mint before adding the other ingredients."),
                                              Instruction(step: 1, method: "In a tin, gently muddle the mint if you don't have sizable ice cubes to do the muddling for you while shaking."),
                                              Instruction(step: 2, method: "Double strain over crushed ice."),
                                              Instruction(step: 3, method: "Garnish with mint sprig.")])
