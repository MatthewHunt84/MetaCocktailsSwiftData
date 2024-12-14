//
//  AmericanGothic.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var americanGothic = Cocktail(cocktailName: "American Gothic",
                              glasswareType: .doubleOld,
                              garnish: nil,
                              ice: .bigRock,
                              author: Author(person: AuthorNames.seanKenyon.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue, year: "2015" ),
                              spec: americanGothicSpec,
                              buildOrder: americanGothicBuild,
                              tags: americanGothicTags,
                              collection: .williamsAndGraham)

let americanGothicSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.otherAlcohol(.absinthe), value: 5 , unit: .sprays),
                                                OldCocktailIngredient(.amari(.leopold3Pins), value: 0.75),
                                                OldCocktailIngredient(.liqueurs(.leopoldCherry), value: 0.5),
                                                OldCocktailIngredient(.whiskies(.eagleRare10), value: 2)]


let americanGothicTags = Tags(profiles: [.rich, .punchy, .spiritForward],
                              styles: [.manhattan, .stirred])



