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
                           variation: .cableCar,
                           collection: .williamsAndGraham)

var cableCarWnGSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                        OldCocktailIngredient(.liqueurs(.cointreau), value: 0.5),
                        OldCocktailIngredient(.syrups(.simple), value: 0.25, prep: PrepBible.simpleSyrupPrep),
                        OldCocktailIngredient(.rums(.sailorJerry), value:2)]

