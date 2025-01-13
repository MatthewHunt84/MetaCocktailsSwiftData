////
////  Penicillin.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 9/25/23.
////

import SwiftUI

var penicillin = Cocktail(cocktailName: "Penicillin",
                          glasswareType: Glassware.doubleOld,
                          garnish: [.candiedGinger],
                          ice: .bigRock,
                          author:Author(person: AuthorNames.samRoss.rawValue,
                                        place: AuthorPlaces.milkAndHoney.rawValue),
                          spec: penicillinSpec,
                          buildOrder: penicillinBuild,
                          tags: penicillinTags,
                          variation: .penicillin,
                          collection: .milkAndHoney,
                          titleCocktail: true)

var penicillinSpec = [OldCocktailIngredient(.juices(.lemon), value: 0.75, unit: .fluidOunces),
                      OldCocktailIngredient(.syrups(.honeySyrup), value: 0.375, prep: PrepBible.honeySyrup),
                      OldCocktailIngredient(.syrups(.gingerSyrup), value: 0.375, prep: PrepBible.gingerSyrup),
                      OldCocktailIngredient(.whiskies(.scotchBlended), value: 2),
                      OldCocktailIngredient(.whiskies(.scotchIsla), value: 0.25)]

var penicillinTags = Tags(flavors: [.lemon, .honey, .ginger, .peat],
                          profiles: [.citrusy, .smokey, .light, .complex],
                          styles: [.sour, .shaken])


