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
                            buildOrder: fogCutterWGBuild,
                            tags: fogCutterTags,
                            variation: .fogCutter,
                            collection: .williamsAndGraham)

let fogCutterSpecWnG   = [CocktailIngredient(.juices(.lemon), value:0.75),
                          CocktailIngredient(.juices(.orange), value: 1),
                          CocktailIngredient(.syrups(.orgeat), value: 0.5, prep: PrepBible.orgeat),
                          CocktailIngredient(.gins(.ransomOldTom), value: 0.25),
                          CocktailIngredient(.brandies(.pFAmber), value: 0.5),
                          CocktailIngredient(.rums(.plantationBarbados), value: 1.5),
                          CocktailIngredient(.fortifiedWines(.sherryEastIndia), value: 0.5)]

var fogCutterWGBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients to a tin, except for the sherry, and shake with ice."),
                                          Instruction(step: 2, method: "Strain into a collins glass and add pebble ice."),
                                          Instruction(step: 3, method: "Garnish with a mint bouquet and orange slices and then float the sherry on top.")])
