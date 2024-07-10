//
//  Dominicana.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var dominicana = Cocktail(cocktailName: "Dominicana",
                          glasswareType: .coupe,
                          garnish: nil,
                          author: sashaPetraske,
                          spec: dominicanaSpec,
                          buildOrder: dominicanaBuild,
                          tags: dominicanaTags,
                          variation: nil,
                          collection: .milkAndHoney)

var dominicanaSpec  = [OldCocktailIngredient(.otherNonAlc(.stiffCream), value: 1.5),
                       OldCocktailIngredient(.liqueurs(.lolita), value: 1.5),
                       OldCocktailIngredient(.rums(.rumDominican), value: 1.5)]

var dominicanaTags = Tags(flavors: [.coffee],
                          profiles: [.bittersweet, .punchy],
                          styles: [.stirred])

var dominicanaBuild = Build(instructions: [Instruction(step: 1, method: "Add the coffee liquor and the rum into a mixing glass and stir with ice."),
                                           Instruction(step: 2, method: "Strain into a chilled coupe and top with a thin layer of the lightly whipped cream.")])
