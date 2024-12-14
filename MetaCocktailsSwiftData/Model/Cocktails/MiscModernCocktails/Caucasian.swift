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

var caucasianSpec  = [OldCocktailIngredient(.liqueurs(.borghetti), value: 1),
                      OldCocktailIngredient(.vodkas(.vodkaAny), value: 2),
                      OldCocktailIngredient(.otherNonAlc(.cream), value: 0.5)]

var caucasianTags = Tags(profiles: [.sweet, .creamy, .rich],
                         styles: [.built])



