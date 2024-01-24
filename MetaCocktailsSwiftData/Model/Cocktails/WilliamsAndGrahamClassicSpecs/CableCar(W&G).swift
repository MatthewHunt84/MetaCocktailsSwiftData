//
//  CableCar(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var cableCarWnG = Cocktail(cocktailName: "Cable Car (Williams and Graham Spec)",
                           glasswareType: .cinnamonSugarRim,
                           garnish: [.noGarnish],
                           author: Author(person: "Tony Abou-Ganim", place:  "Starlight Room, San Francisco", year: "1996"),
                           spec: cableCarSpec,
                           tags: cableCarTags)

var cableCarWnGSpec  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                        CocktailIngredient(.liqueurs(.cointreau), value: 0.5),
                        CocktailIngredient(.syrups(.simple), value: 0.25),
                        CocktailIngredient(.rums(.sailorJerry), value:2)]

