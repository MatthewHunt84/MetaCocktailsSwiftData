//
//  Brunelle.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

let brunelle = Cocktail(cocktailName: "Brunelle",
                        glasswareType: .stemmedGlassware,
                        author: Author(person: AuthorNames.harryCraddock.rawValue, place: AuthorPlaces.savoy.rawValue, year: "1930"),
                        spec: brunelleSpec,
                        tags: brunelleTags)

var brunelleSpec: [CocktailIngredient] = [CocktailIngredient(.otherAlcohol(.absinthe), value: 1),
                                          CocktailIngredient(.juices(.lemon), value: 1),
                                          CocktailIngredient(.syrups(.simple), value: 1)]

var brunelleTags = Tags(profiles: [.citrusy, .refreshing, .light],
                        styles: [.sour, .shaken])


