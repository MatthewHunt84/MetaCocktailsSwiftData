//
//  Conference.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/17/24.
//

import Foundation

var conference = Cocktail(cocktailName: "Conference",
                          glasswareType: .doubleOld,
                          garnish: [.lemonPeel, .orangePeel],
                          ice: .bigRock,
                          author: Author(person: AuthorNames.brianMiller.rawValue,
                                         place: AuthorPlaces.deathAndCo.rawValue),
                          spec: conferenceSpec,
                          tags: conferenceTags,
                          collection: .williamsAndGraham)

let conferenceSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.bitters(.chocolateMole), value: 1, unit: .dashes),
                                               OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                                               OldCocktailIngredient(.syrups(.richDem), value: 1, unit: .teaspoon, prep: PrepBible.richDem),
                                               OldCocktailIngredient(.whiskies(.rittenhouseRye), value: 0.5),
                                               OldCocktailIngredient(.brandies(.boulardCalvados), value: 0.5),
                                               OldCocktailIngredient(.brandies(.hineCognac), value: 0.5),
                                               OldCocktailIngredient(.whiskies(.buffaloTrace), value: 0.5)]


let conferenceTags = Tags(flavors: [.orange, .lemon],
                          profiles: [.bittersweet, .spiritForward, .complex, .fruity],
                          styles: [.oldFashioned, .stirred, .tiki])

