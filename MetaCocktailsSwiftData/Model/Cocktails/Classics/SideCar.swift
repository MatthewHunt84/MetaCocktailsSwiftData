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
                       author: Author(person: "MacGarry", place: "Bucks Club, London", year: "1920ish"),
                       spec: sidecarSpec ,
                       buildOrder: nil,
                       tags: sidecarTags,
                       variation: .sidecar,
                       collection: .originals,
                       titleCocktail: true)

var sidecarSpec  = [OldCocktailIngredient(.juices(.lemon), value: 1),
                    OldCocktailIngredient(.liqueurs(.cointreau), value: 1),
                    OldCocktailIngredient(.brandies(.cognacVSOP), value: 1)]

var sidecarTags = Tags(profiles: [.citrusy, .fruity, .tart, .light],
                       styles: [.daisy, .shaken, .sour])

