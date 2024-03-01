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
                           author: Author(person: "Matt Hunt",
                                          place: AuthorPlaces.williamsAndGraham.rawValue,
                                          year: "2021"),
                           spec: theTravelerSpec,
                           tags: theTravelerTags,
                           collection: .williamsAndGraham)

let theTravelerSpec: [CocktailIngredient] = [CocktailIngredient(.bitters(.angosturaBitters), value: 3, unit: .dashes),
                                             CocktailIngredient(.syrups(.vanilla), value: 1, unit: .barSpoon),
                                             CocktailIngredient(.rums(.smithAndCross), value: 0.25),
                                             CocktailIngredient(.whiskies(.bowmore12), value: 0.25),
                                             CocktailIngredient(.amari(.cioCiaroAmaro), value: 0.5),
                                             CocktailIngredient(.rums(.plantationPineapple), value: 0.5),
                                             CocktailIngredient(.whiskies(.johnnyDrum), value: 0.5)]


let theTravelerTags = Tags(profiles: [.bittersweet, .spiritForward, .complex, .fruity],
                           styles: [.oldFashioned, .stirred, .tiki])

