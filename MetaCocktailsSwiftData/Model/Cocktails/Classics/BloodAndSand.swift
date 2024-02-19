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
                             variation: .bloodAndSand)

var bloodAndSandSpec  = [CocktailIngredient(.juices(.orange), value: 0.75),
                         CocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 0.75),
                         CocktailIngredient(.liqueurs(.cherryHeering), value: 0.75),
                         CocktailIngredient(.whiskies(.scotchBlended), value: 0.75)]

var bloodAndSandBuild  = Build(instructions: [Instruction(step: 1, method: "Gross")])

var bloodAndSandTags   = Tags(profiles: [.fruity, .sweet],
                              styles: [.daisy, .sour, .shaken])

