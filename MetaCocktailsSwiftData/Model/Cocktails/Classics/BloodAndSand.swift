//
//  BloodAndSand.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/21/24.
//

import Foundation

var bloodAndSand  = Cocktail(cocktailName: "Blood and Sand",
                             glasswareType: .martini,
                             garnish: [.orangePeel],
                             ice: nil,
                             author: harryCraddock,
                             spec: bloodAndSandSpec,
                             buildOrder: bloodAndSandBuild,
                             tags: bloodAndSandTags,
                             variation: .bloodAndSand,
                             collection: .originals,
                             titleCocktail: true)

var bloodAndSandSpec  = [OldCocktailIngredient(.juices(.orange), value: 0.75),
                         OldCocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 0.75),
                         OldCocktailIngredient(.liqueurs(.cherryHeering), value: 0.75),
                         OldCocktailIngredient(.whiskies(.scotchBlended), value: 0.75)]

var bloodAndSandBuild  = Build(instructions: [Instruction(step: 1, method: "Gross")])

var bloodAndSandTags   = Tags(profiles: [.fruity, .sweet],
                              styles: [.daisy, .sour, .shaken])

