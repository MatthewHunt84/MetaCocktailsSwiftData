//
//  MintJulep(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var mintJulepWnG = Cocktail(cocktailName: "Mint Julep (W&G Version)",
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

let mintJulepSpecWnG: [OldCocktailIngredient] = [OldCocktailIngredient(.herbs(.mint), value: 10, unit: .gentlyMuddled),
                                              OldCocktailIngredient(.syrups(.simple), value: 0.5),
                                              OldCocktailIngredient(.whiskies(.fourRosesYellowLabel), value: 2.5)]
