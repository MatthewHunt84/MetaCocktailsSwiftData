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

var spanishRevivalSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                           OldCocktailIngredient(.agaves(.tequilaOchoBlanco), value: 0.75),
                           OldCocktailIngredient(.liqueurs(.cointreau), value: 0.75),
                           OldCocktailIngredient(.liqueurs(.giffardPamplemousse), value: 0.75),
                           OldCocktailIngredient(.otherAlcohol(.absinthe), value: 5, unit: .sprays)]

var spanishRevivalTags = Tags(profiles: [.light, .fruity, .refreshing],
                              styles: [.sour, .shaken])


