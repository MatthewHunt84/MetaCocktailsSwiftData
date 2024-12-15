//
//  WhereEaglesFly.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var whereEaglesFly = Cocktail(cocktailName: "Where Eagles Fly",
                              glasswareType: .collins,
                              garnish: [.lemonWheel, .basilSprig],
                              ice: nil,
                              author: Author(person: AuthorNames.allisonWiddecombe.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue),
                              spec: whereEaglesFlySpec,
                              buildOrder: whereEaglesFlyBuild,
                              tags: whereEaglesFlyTags,
                              collection: .williamsAndGraham)

var whereEaglesFlySpec  = [OldCocktailIngredient(.wines(.prosecco), value: 2),
                           OldCocktailIngredient(.herbs(.basil), value: 3, unit: .gentlyMuddled),
                           OldCocktailIngredient(.juices(.lemon), value: 0.75),
                           OldCocktailIngredient(.syrups(.passionfruitSyrup), value: 0.75, prep: PrepBible.passionfruitSyrupPrep),
                           OldCocktailIngredient(.amari(.cynar), value: 0.5),
                           OldCocktailIngredient(.whiskies(.eagleRare10), value: 1.5)]

var whereEaglesFlyTags = Tags(profiles: [.refreshing, .fruity, .citrusy],
                              styles: [.sour, .shaken])


