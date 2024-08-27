//
//  TheTraveler.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var theTraveler = Cocktail(cocktailName: "The Traveler",
                           imageAsset: nil,
                           glasswareType: .doubleOld,
                           garnish: [.lemonPeel, .orangePeel],
                           ice: .bigRock,
                           author: Author(person: AuthorNames.mattHunt.rawValue,
                                          place: AuthorPlaces.williamsAndGraham.rawValue,
                                          year: "2021"),
                           spec: theTravelerSpec,
                           tags: theTravelerTags,
                           collection: .williamsAndGraham)

let theTravelerSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.bitters(.angosturaBitters), value: 3, unit: .dashes),
                                                OldCocktailIngredient(.syrups(.vanilla), value: 1, unit: .barSpoon, prep: PrepBible.vanillaSyrup),
                                                OldCocktailIngredient(.rums(.smithAndCross), value: 0.25),
                                                OldCocktailIngredient(.whiskies(.bowmore12), value: 0.25),
                                                OldCocktailIngredient(.amari(.cioCiaroAmaro), value: 0.5),
                                                OldCocktailIngredient(.rums(.plantationPineapple), value: 0.5),
                                                OldCocktailIngredient(.whiskies(.johnnyDrum), value: 0.5)]


let theTravelerTags = Tags(flavors: [.orange, .lemon],
                           profiles: [.bittersweet, .spiritForward, .complex, .fruity],
                           styles: [.oldFashioned, .stirred, .tiki])

