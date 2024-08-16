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
                              author: Author(person: AuthorPlaces.williamsAndGraham.rawValue),
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

var whereEaglesFlyTags = Tags(profiles: [.refreshing, .fruity, .bright],
                              styles: [.sour, .shaken])

var whereEaglesFlyBuild = Build(instructions: [Instruction(step: 1, method: "Gently muddle the basil."),
                                               Instruction(step: 1, method: "add the rest of the ingredients except for the Prosecco."),
                                               Instruction(step: 1, method: "Shake and then double strain over ice."),
                                               Instruction(step: 1, method: "Top with Prosecco."),
                                               Instruction(step: 1, method: "Garnish with a lemon wheel and basil.")])
