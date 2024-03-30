//
//  SpanishRevival.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation

var spanishRevival = Cocktail(cocktailName: "Spanish Revival",
                              glasswareType: .stemmedGlassware,
                              garnish: [.grapefruitPeel],
                              ice: nil,
                              author:Author(person: AuthorNames.jamesMenkal.rawValue,
                                            place: AuthorPlaces.williamsAndGraham.rawValue),
                              spec: spanishRevivalSpec,
                              buildOrder: spanishRevivalBuild,
                              tags: spanishRevivalTags,
                              collection: .williamsAndGraham)

var spanishRevivalSpec  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                           CocktailIngredient(.agaves(.tequilaOchoBlanco), value: 0.75),
                           CocktailIngredient(.liqueurs(.cointreau), value: 0.75),
                           CocktailIngredient(.liqueurs(.giffardPamplemousse), value: 0.75),
                           CocktailIngredient(.otherAlcohol(.absinthe), value: 5, unit: .sprays)]

var spanishRevivalTags = Tags(profiles: [.light, .fruity, .refreshing],
                              styles: [.sour, .shaken])

var spanishRevivalBuild  = Build(instructions: [Instruction(step: 1, method: "Combine all ingredients, except for the absinthe, into a tin with ice and shake."),
                                                Instruction(step: 2, method: "Rinse your stemmed glassware with the absinthe."),
                                                Instruction(step: 3, method: "Strain the cocktail into the prepared glass and garnish with a grapefruit peel.")])
