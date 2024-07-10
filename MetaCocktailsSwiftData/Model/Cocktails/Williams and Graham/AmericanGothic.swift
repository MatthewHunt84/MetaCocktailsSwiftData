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
                              buildOrder: americanGothicBuild,
                              tags: americanGothicTags,
                              collection: .williamsAndGraham)

let americanGothicSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.otherAlcohol(.absinthe), value: 5 , unit: .sprays),
                                                OldCocktailIngredient(.amari(.leopold3Pins), value: 0.75),
                                                OldCocktailIngredient(.liqueurs(.leopoldCherry), value: 0.5),
                                                OldCocktailIngredient(.whiskies(.eagleRare10), value: 2)]


let americanGothicTags = Tags(profiles: [.rich, .punchy, .spiritForward],
                              styles: [.manhattan, .stirred])


var americanGothicBuild  = Build(instructions: [Instruction(step: 1, method: "Combine all ingredients, except for the absinthe, into a mixing glass with ice and stir."),
                                                Instruction(step: 2, method: "Rinse a double old fashioned glass with absinthe."),
                                                Instruction(step: 3, method: "Strain the cocktail into the glass over a large rock.")])
