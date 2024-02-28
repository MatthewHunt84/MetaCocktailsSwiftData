//
//  FogCutter(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var fogCutterWnG = Cocktail(cocktailName: "Fog Cutter(W&G Version)",
                            imageAsset: nil,
                            glasswareType: .collins,
                            garnish: [.mintBouquet, .halfOrangeWheel],
                            ice: .pebbleIce,
                            author: williamsAndGraham,
                            spec: fogCutterSpecWnG,
                            tags: fogCutterTags,
                            variation: .fogCutter)

let fogCutterSpecWnG   = [CocktailIngredient(.juices(.lemon), value:0.75),
                          CocktailIngredient(.juices(.orange), value: 1),
                          CocktailIngredient(.syrups(.orgeat), value: 0.5, prep: PrepBibleViewModel().orgeat),
                          CocktailIngredient(.gins(.ransomOldTom), value: 0.25),
                          CocktailIngredient(.brandies(.pFAmber), value: 0.5),
                          CocktailIngredient(.rums(.plantationBarbados), value: 1.5),
                          CocktailIngredient(.fortifiedWines(.sherryEastIndia), value: 0.5, unit: .fluidOuncesFloated)]
