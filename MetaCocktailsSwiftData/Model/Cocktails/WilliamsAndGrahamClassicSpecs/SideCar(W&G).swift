//
//  SideCar(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var sidecarWnG = Cocktail(cocktailName: "Sidecar (W&G Version)",
                          glasswareType: .sugarRimStemmed,
                          ice: nil,
                          author: williamsAndGraham,
                          spec: sidecarSpecWnG,
                          buildOrder: nil,
                          tags: sidecarTagsWnG,
                          variation: .sidecar,
                          collection: .williamsAndGraham)

var sidecarSpecWnG  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                       OldCocktailIngredient(.liqueurs(.dryCuracao), value: 0.75),
                       OldCocktailIngredient(.brandies(.pFAmber), value: 2)]

var sidecarTagsWnG = Tags(profiles: [.citrusy, .fruity, .tart, .light],
                          styles: [.sour, .shaken])

