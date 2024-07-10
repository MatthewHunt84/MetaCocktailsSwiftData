//
//  Debbie, Don't.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/5/24.
//

import Foundation

var debbieDont = Cocktail(cocktailName: "Debbie, Don't",
                          glasswareType: .coupe,
                          garnish: nil,
                          ice: nil,
                          author:Author(person: AuthorNames.zacharyRubin.rawValue ,  place: AuthorPlaces.dutchKills.rawValue , year: "Early 2000s"),
                          spec: debbieDontSpec,
                          buildOrder: nil,
                          tags: debbieDontTags,
                          collection: .milkAndHoney)

var debbieDontSpec     =  [OldCocktailIngredient(.syrups(.mapleSyrup), value: 0.5),
                           OldCocktailIngredient(.juices(.lemon), value: 0.75),
                           OldCocktailIngredient(.amari(.averna), value: 1),
                           OldCocktailIngredient(.agaves(.tequilaReposado), value: 1)]

var debbieDontTags     = Tags(profiles: [.complex, .bittersweet, .citrusy],
                              styles: [.sour, .shaken])
