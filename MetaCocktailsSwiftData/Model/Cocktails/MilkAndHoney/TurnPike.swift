//
//  TurnPike.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var turnpike = Cocktail(cocktailName: "Turnpike",
                        glasswareType: .coupe,
                        garnish: [.lemonWedge],
                        ice: nil,
                        author:Author(person: AuthorNames.josephSchwartz.rawValue ,
                                      place: AuthorPlaces.milkAndHoney.rawValue ,
                                      year: "Early 2000s"),
                        spec: turnpikeSpec,
                        buildOrder: nil,
                        tags: turnpikeTags,
                        collection: .milkAndHoney)

var turnpikeSpec     =  [OldCocktailIngredient(.syrups(.simple), value: 0.75),
                         OldCocktailIngredient(.juices(.lemon), value: 0.75),
                         OldCocktailIngredient(.brandies(.lairdsApplejack), value: 0.75),
                         OldCocktailIngredient(.whiskies(.monongahelaRye), value: 1)]

var turnpikeTags     = Tags(profiles: [.light, .refreshing, .citrusy],
                            styles: [.sour, .shaken])
