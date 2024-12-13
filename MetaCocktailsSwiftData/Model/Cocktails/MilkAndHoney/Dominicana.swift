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


