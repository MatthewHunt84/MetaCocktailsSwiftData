//
//  CableCar(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var cableCarWnG = Cocktail(cocktailName: "Cable Car (W&G Version)",
                           glasswareType: .cinnamonSugarRim,
                           garnish: [.noGarnish],
                           author: williamsAndGraham,
                           spec: cableCarWnGSpec,
                           tags: cableCarTags,
                           collection: .williamsAndGraham)

var cableCarWnGSpec  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                        CocktailIngredient(.liqueurs(.cointreau), value: 0.5),
                        CocktailIngredient(.syrups(.simple), value: 0.25),
                        CocktailIngredient(.rums(.sailorJerry), value:2)]

