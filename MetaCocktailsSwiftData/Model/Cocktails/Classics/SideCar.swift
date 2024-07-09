//
//  SideCar.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/21/24.
//

import Foundation


var sidecar = Cocktail(cocktailName: "Sidecar",
                       glasswareType: .sugarRimStemmed,
                       ice: nil,
                       spec: sidecarSpec,
                       buildOrder: nil,
                       tags: sidecarTags,
                       variation: .sidecar,
                       collection: .originals,
                       titleCocktail: true)

var sidecarSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.5),
                    OldCocktailIngredient(.liqueurs(.cointreau), value: 0.75),
                    OldCocktailIngredient(.brandies(.cognacVSOP), value: 1.5)]

var sidecarTags = Tags(profiles: [.citrusy, .fruity, .tart, .light],
                       styles: [.daisy, .shaken, .sour])

