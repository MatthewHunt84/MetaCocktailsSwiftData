//
//  AmericanTrilogy.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/27/24.
//

import Foundation

var americanTrilogy = Cocktail(cocktailName: "American Trilogy",
                               glasswareType: .doubleOld,
                               garnish: [.lemonPeel, .orangePeel],
                               ice: .bigRock,
                               author: Author(person: "Michael McIlroy, Richard Boccato", place: AuthorPlaces.milkAndHoney.rawValue, year: "Early 2000s"),
                               spec: americanTrilogySpec,
                               buildOrder: americanTrilogyBuild,
                               tags: americanTrilogyTags,
                               variation: nil,
                               collection: .milkAndHoney)

var americanTrilogySpec  =  [OldCocktailIngredient(.otherNonAlc(.sugarCube), value: 1, unit: .muddled),
                             OldCocktailIngredient(.soda(.sodaWater), value: 1, unit: .splash),
                             OldCocktailIngredient(.bitters(.orangeBitters), value: 3, unit: .dashes),
                             OldCocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 1),
                             OldCocktailIngredient(.brandies(.lairdsBonded), value: 1)]

var americanTrilogyTags = Tags(flavors: [.orange, .lemon], profiles: [.bittersweet, .spiritForward],
                                styles: [.oldFashioned, .stirred])


