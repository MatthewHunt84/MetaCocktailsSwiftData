//
//  MintJulep(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var mintJulepWnG = Cocktail(cocktailName: "Mint Julep" + wAndGTitleTag,
                            imageAsset: nil,
                            glasswareType: .julep,
                            garnish: [.mintBouquet],
                            ice: .pebbleIce,
                            author: williamsAndGraham,
                            spec: mintJulepSpecWnG,
                            buildOrder: mintJulepBuild,
                            tags: mintJulepTags,
                            variation: .mintJulep,
                            collection: .williamsAndGraham)

let mintJulepSpecWnG: [OldCocktailIngredient] = [OldCocktailIngredient(.herbs(.mint), value: 10, unit: .gentlyMuddled),
                                                 OldCocktailIngredient(.syrups(.simple), value: 0.5, prep: PrepBible.simpleSyrupPrep),
                                                 OldCocktailIngredient(.whiskies(.fourRosesYellowLabel), value: 2.5)]
