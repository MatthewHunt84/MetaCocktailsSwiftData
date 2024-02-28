//
//  TiPunch.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/21/24.
//

import Foundation


var tiPunch = Cocktail(cocktailName: "Ti' Punch(1800s)",
                       glasswareType: .doubleOld,
                       garnish: [.limePeel],
                       ice: .bigRock,
                       author:Author(place: "Somewhere in Martinique"),
                       spec: tiPunchSpec,
                       buildOrder: tiPunchBuildOrder,
                       tags: tiPunchTags,
                       variation: .tiPunch)

var tiPunchSpec  =  [CocktailIngredient(.syrups(.richDem), value: 2, unit: .teaspoon, prep: PrepBibleViewModel().richDem),
                     CocktailIngredient(.rums(.rumWhiteAgricole), value: 2)]

var tiPunchTags = Tags( profiles: [.sweet, .spiritForward, .funky],
                        styles: [.oldFashioned, .stirred])

var tiPunchBuildOrder = Build(instructions: [Instruction(step: 1, method: "Think of this like an old-fashioned without the bitters")])
