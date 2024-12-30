//
//  FogCutter(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var fogCutterWnG = Cocktail(cocktailName: "Fog Cutter" + wAndGTitleTag,
                            glasswareType: .collins,
                            garnish: [.mintBouquet, .halfOrangeWheel],
                            ice: .pebbleIce,
                            author: williamsAndGraham,
                            spec: fogCutterSpecWnG,
                            buildOrder: fogCutterWGBuild,
                            tags: fogCutterTags,
                            variation: .fogCutter,
                            collection: .williamsAndGraham)

let fogCutterSpecWnG   = [OldCocktailIngredient(.juices(.lemon), value:0.75),
                          OldCocktailIngredient(.juices(.orange), value: 1),
                          OldCocktailIngredient(.syrups(.orgeat), value: 0.5, prep: PrepBible.orgeat),
                          OldCocktailIngredient(.gins(.ransomOldTom), value: 0.25),
                          OldCocktailIngredient(.brandies(.pFAmber), value: 0.5),
                          OldCocktailIngredient(.rums(.plantationBarbados), value: 1.5),
                          OldCocktailIngredient(.fortifiedWines(.sherryEastIndia), value: 0.5)]

