//
//  SilverMonk.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/14/24.
//

import Foundation


var silverMonk = Cocktail(cocktailName: "Silver Monk",
                          imageAsset: nil,
                          glasswareType: .coupe,
                          garnish: [.cucumberSliceLong],
                          ice: nil,
                          author: Author(person: AuthorNames.philWard.rawValue ,
                                         place: AuthorPlaces.deathAndCo.rawValue,
                                         year: "Early 2000s"),
                          spec: silverMonkSpec,
                          buildOrder: nil ,
                          tags: silverMonkTags,
                          variation: nil,
                          collection: .deathAndCo,
                          titleCocktail: false)

let silverMonkSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.herbs(.mint), value: 8, unit: .gentlyMuddled),
                                            OldCocktailIngredient(.fruit(.cucumberSlices), value: 2, unit: .muddled),
                                            OldCocktailIngredient(.seasoning(.salt), value: 1, unit: .pinch),
                                            OldCocktailIngredient(.juices(.lime), value: 0.75),
                                            OldCocktailIngredient(.syrups(.simple), value: 0.5),
                                            OldCocktailIngredient(.liqueurs(.yellowChartreuse), value: 0.75),
                                            OldCocktailIngredient(.agaves(.tequilaBlanco), value: 2)]

let silverMonkTags = Tags(profiles: [.herbal, .refreshing, .light, .restorative],
                          styles: [.sour, .shaken])
