//
//  Caucasian.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var caucasian = Cocktail(cocktailName: "Caucasian",
                         glasswareType: .fizzGlass,
                         garnish: [.noGarnish],
                         ice: .koldDraft,
                         author:Author(place: "The Dude Abides", year: "1998"),
                         spec: caucasianSpec,
                         buildOrder: caucasianBuild,
                         tags: caucasianTags)

var caucasianSpec  = [CocktailIngredient(.liqueurs(.borghetti), value: 1),
                      CocktailIngredient(.vodkas(.vodkaAny), value: 2),
                      CocktailIngredient(.otherNonAlc(.cream), value: 0.5)]

var caucasianTags = Tags(profiles: [.sweet, .creamy, .rich],
                         styles: [.built])

var caucasianBuild = Build(instructions: [Instruction(step: 1, method: "Add everything but the cream to a frozen fizz glass or small highball and stir."),
                                          Instruction(step: 2, method: "Top with cream.")])

