//
//  SideCar(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var sidecarWnG = Cocktail(cocktailName: "Sidecar(W&G Version)",
                       glasswareType: .sugarRimStemmed,
                       ice: nil,
                       spec: sidecarSpec,
                       buildOrder: nil,
                       tags: sidecarTags)

var sidecarSpecWnG  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                    CocktailIngredient(.liqueurs(.dryCuracao), value: 0.75),
                    CocktailIngredient(.brandies(.pFAmber), value: 2)]

var sidecarTagsWnG = Tags(profiles: [.citrusy, .fruity, .tart, .light],
                       styles: [.sour, .shaken])

