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
                              tags: spanishRevivalTags)

var spanishRevivalSpec  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                           CocktailIngredient(.agaves(.tequilaOchoBlanco), value: 0.75),
                           CocktailIngredient(.liqueurs(.cointreau), value: 0.75),
                           CocktailIngredient(.liqueurs(.giffardPamplemousse), value: 0.75),
                           CocktailIngredient(.otherAlcohol(.absinthe), value: 1, unit: .glassRinse)]

var spanishRevivalTags = Tags(profiles: [.light, .fruity, .refreshing],
                              styles: [.sour, .shaken])
