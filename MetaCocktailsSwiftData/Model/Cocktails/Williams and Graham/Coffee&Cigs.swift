//
//  Coffee&Cigs.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var coffeeAndCigs = Cocktail(cocktailName: "Coffee & Cigs",
                             glasswareType: .doubleOld,
                             garnish: [.nutmeg],
                             ice: .koldDraft,
                             author:Author(place: AuthorPlaces.williamsAndGraham.rawValue),
                             spec: coffeeAndCigsSpec,
                             buildOrder: nil,
                             tags: coffeeAndCigsTags,
                             collection: .williamsAndGraham)

var coffeeAndCigsSpec  = [OldCocktailIngredient(.otherNonAlc(.stiffCream), value: 1),
                          OldCocktailIngredient(.liqueurs(.borghetti), value: 1),
                          OldCocktailIngredient(.amari(.averna), value: 0.5),
                          OldCocktailIngredient(.whiskies(.buffaloTrace), value: 1.5)]

var coffeeAndCigsTags = Tags(profiles: [.punchy, .rich, .bittersweet],
                             styles: [.oldFashioned, .stirred, .built])

var coffeeAndCigsBuild = Build(instructions: [Instruction(step: 1, method: "Add Kold Draft and all ingredients besides the cream to a double old fashioned glass and stir in glass."),
                                              Instruction(step: 2, method: "Float the stiff cream on top."),
                                              Instruction(step: 3, method: "Garnish with grated nutmeg.")])
