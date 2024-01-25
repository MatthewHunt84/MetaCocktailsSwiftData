//
//  FogCutter(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var fogCutterWnG = Cocktail(cocktailName: "Fog Cutter (Williams & Graham Spec)",
                            imageAsset: nil,
                            glasswareType: .collins,
                            garnish: [.mintBouquet, .halfOrangeWheel],
                            ice: .pebbleIce,
                            author: Author(person: AuthorNames.traderVic.rawValue,
                                           year: "1940"),
                            spec: fogCutterSpecWnG,
                            tags: fogCutterTags)

let fogCutterSpecWnG     = [CocktailIngredient(.juices(.lemon), value: 2),
                            CocktailIngredient(.juices(.orange), value: 1),
                            CocktailIngredient(.syrups(.orgeat), value: 0.5),
                            CocktailIngredient(.gins(.ginAny), value: 0.5),
                            CocktailIngredient(.brandies(.brandyAny), value: 1),
                            CocktailIngredient(.rums(.rumPuertoRican), value: 2),
                            CocktailIngredient(.fortifiedWines(.sherryEastIndia), value: 0.5, unit: .fluidOuncesFloated)]

