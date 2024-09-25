//
//  BloodyMary.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var bloodyMary  = Cocktail(cocktailName: "Bloody Mary",
                           glasswareType: .collins,
                           garnish: [.garnishAtWill],
                           ice: .koldDraft,
                           spec: bloodyMarrySpec,
                           buildOrder: bloodyMarryBuild,
                           notes: bloodyMaryNotes,
                           tags: bloodyMarryTags,
                           variation: .bloodyMary,
                           titleCocktail: true)

var bloodyMarrySpec  = [OldCocktailIngredient(.otherNonAlc(.tomatoJuice), value: 4.5),
                        OldCocktailIngredient(.otherNonAlc(.worcestershire), value: 3, unit: .dashes),
                        OldCocktailIngredient(.juices(.lemon), value: 0.5),
                        OldCocktailIngredient(.otherNonAlc(.tobasco), value: 3, unit: .dashes),
                        OldCocktailIngredient(.vodkas(.vodkaAny), value: 1.5)]

var bloodyMarryBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients along with the ice and toss from tin to tin or shake gently."),
                                             Instruction(step: 2, method: "Dirty dump."),
                                             Instruction(step: 2, method: "Go nuts with the garnish if you'd like to.")])

var bloodyMarryTags   = Tags(profiles: [.savory, .rich, .restorative])

var bloodyMaryNotes = "The origins of this cocktail are shrouded in mystery, with several unverified stories claiming its creation. We present here a simple, classic version of the recipe. Feel free to embellish or modify it to suit your own tastes."
