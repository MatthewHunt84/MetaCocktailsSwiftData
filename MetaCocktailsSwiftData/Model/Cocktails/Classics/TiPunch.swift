//
//  TiPunch.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/21/24.
//

import Foundation


var tiPunch = Cocktail(cocktailName: "Ti' Punch",
                       glasswareType: .doubleOld,
                       garnish: [.limePeel],
                       ice: .bigRock,
                       author:Author(place: "Somewhere in Martinique", year: "1700s"),
                       spec: tiPunchSpec,
                       buildOrder: tiPunchBuildOrder,
                       tags: tiPunchTags,
                       variation: .tiPunch,
                       titleCocktail: true)

var tiPunchSpec  =  [OldCocktailIngredient(.syrups(.richDem), value: 2, unit: .teaspoon, prep: PrepBible.richDem),
                     OldCocktailIngredient(.rums(.rumWhiteAgricole), value: 2)]

var tiPunchTags = Tags(flavors: [.lime],
                       profiles: [.sweet, .spiritForward, .funky],
                       styles: [.oldFashioned, .stirred])


