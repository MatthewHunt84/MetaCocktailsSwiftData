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
                          buildOrder: nil,
                          tags: dominicanaTags,
                          variation: nil,
                          collection: .milkAndHoney)

var dominicanaSpec  = [CocktailIngredient(.otherNonAlc(.stiffCream), value: 2, unit: .fluidOuncesFloated),
                       CocktailIngredient(.liqueurs(.borghetti), value: 1.5),
                       CocktailIngredient(.rums(.rumDominican), value: 1.5)]

var dominicanaTags = Tags(flavors: [.coffee],
                          profiles: [.bittersweet, .punchy],
                          styles: [.stirred])
