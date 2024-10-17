//
//  Shokunin.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var shokunin = Cocktail(cocktailName: "Shokunin",
                        glasswareType: .singleOld,
                        garnish: [.flamedOrange, .chiliOil],
                        ice: .pebbleIce,
                        author: Author(person: "Kenny Remster", place: AuthorPlaces.williamsAndGraham.rawValue, year: "2018"),
                        spec: shokuninSpec,
                        buildOrder: shokuninBuild,
                        tags: shokuninTags,
                        collection: .williamsAndGraham)

let shokuninSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.fortifiedWines(.carpanoBianco), value: 1),
                                          OldCocktailIngredient(.amari(.campari), value: 1),
                                          OldCocktailIngredient(.wines(.junmeiSake), value: 1.5)]


let shokuninTags = Tags(flavors: [.orange],
                        profiles: [.light, .complex, .bittersweet],
                        styles: [.stirred, .negroni])

let shokuninBuild = Build(instructions: [Instruction(step: 1, method: "Stir the sake, vermouth and Campari."),
                                         Instruction(step: 2, method: "Flame the orange into the chilled glass then add the stirred cocktail."),
                                         Instruction(step: 2, method: "Add pebble Ice."),
                                         Instruction(step: 2, method: "Drop chili oil over the ice and serve. No straw.")])
