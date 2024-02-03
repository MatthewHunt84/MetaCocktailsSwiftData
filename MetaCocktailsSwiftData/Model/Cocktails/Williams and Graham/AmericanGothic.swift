//
//  AmericanGothic.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var americanGothic = Cocktail(cocktailName: "American Gothic",
                              imageAsset: nil,
                              glasswareType: .doubleOld,
                              garnish: nil,
                              ice: .bigRock,
                              author: Author(place: AuthorPlaces.williamsAndGraham.rawValue),
                              spec: americanGothicSpec,
                              tags: americanGothicTags)

let americanGothicSpec: [CocktailIngredient] = [CocktailIngredient(.otherAlcohol(.absinthe), value: 1, unit: .glassRinse),
                                                CocktailIngredient(.amari(.leopold3Pins), value: 0.75),
                                                CocktailIngredient(.liqueurs(.leopoldCherry), value: 0.5),
                                                CocktailIngredient(.whiskies(.eagleRare10), value: 2)]


let americanGothicTags = Tags(profiles: [.rich, .punchy, .spiritForward],
                              styles: [.manhattan, .stirred])

