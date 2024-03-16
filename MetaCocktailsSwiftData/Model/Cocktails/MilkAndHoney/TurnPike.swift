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

var turnpikeSpec     =  [CocktailIngredient(.syrups(.simple), value: 0.75),
                         CocktailIngredient(.juices(.lemon), value: 0.75),
                         CocktailIngredient(.brandies(.lairdsApplejack), value: 0.75),
                         CocktailIngredient(.whiskies(.monongahelaRye), value: 1)]

var turnpikeTags     = Tags(profiles: [.light, .refreshing, .citrusy],
                            styles: [.sour, .shaken])
