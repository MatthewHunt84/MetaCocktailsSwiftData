//
//  MintJulep(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var mintJulepWnG = Cocktail(cocktailName: "Mint Julep(W&G Version)",
                            imageAsset: nil,
                            glasswareType: .julep,
                            garnish: [.mintBouquet],
                            ice: .pebbleIce,
                            author: Author(person: "Old as Fuck."),
                            spec: mintJulepSpecWnG,
                            buildOrder: mintJulepBuild,
                            tags: mintJulepTags,
                            variation: .mintJulep,
                            collection: .williamsAndGraham)

let mintJulepSpecWnG: [CocktailIngredient] = [CocktailIngredient(.herbs(.mint), value: 10, unit: .gentlyMuddled),
                                              CocktailIngredient(.syrups(.simple), value: 0.5),
                                              CocktailIngredient(.whiskies(.fourRosesYellowLabel), value: 2.5)]
