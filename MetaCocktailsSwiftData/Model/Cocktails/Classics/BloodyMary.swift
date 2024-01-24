//
//  BloodyMary.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var bloodyMarry  = Cocktail(cocktailName: "Bloody Marry",
                            glasswareType: .collins,
                            garnish: [.garnishAtWill],
                            ice: .koldDraft,
                            spec: bloodyMarrySpec,
                            buildOrder: bloodyMarryBuild,
                            tags: bloodyMarryTags)

var bloodyMarrySpec  = [CocktailIngredient(.otherNonAlc(.tomatoJuice), value: 4.5),
                        CocktailIngredient(.otherNonAlc(.worcestershire), value: 3, unit: .dashes),
                        CocktailIngredient(.juices(.lemon), value: 0.5),
                        CocktailIngredient(.otherNonAlc(.tobasco), value: 3, unit: .dashes),
                        CocktailIngredient(.vodkas(.vodkaAny), value: 1.5)]

var bloodyMarryBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients along with the ice and toss from tin to tin or shake gently."),
                                             Instruction(step: 2, method: "Dirty dump."),
                                             Instruction(step: 2, method: "Go nuts with the garnish if you'd like to.")])

var bloodyMarryTags   = Tags(profiles: [.savory],
                             textures: [.rich],
                             styles: [.restorative])

