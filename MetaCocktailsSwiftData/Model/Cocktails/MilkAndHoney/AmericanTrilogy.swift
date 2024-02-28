//
//  AmericanTrilogy.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/27/24.
//

import Foundation

var americanTrilogy = Cocktail(cocktailName: "The American Trilogy",
                               glasswareType: .doubleOld,
                               garnish: [.lemonPeel, .orangePeel],
                               ice: .bigRock,
                               author: Author(person: "Michael McIlroy, Richard Boccato", place: AuthorPlaces.milkAndHoney.rawValue, year: "Early 2000s"),
                               spec: americanTrilogySpec,
                               tags: americanTrilogyTags,
                               variation: .oldFashioned)

var americanTrilogySpec  =  [CocktailIngredient(.otherNonAlc(.sugarCube), value: 1, unit: .muddled),
                             CocktailIngredient(.soda(.sodaWater), value: 1, unit: .splash),
                             CocktailIngredient(.bitters(.orangeBitters), value: 3, unit: .dashes),
                             CocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 1),
                             CocktailIngredient(.brandies(.lairdsBonded), value: 1)]

var americanTrilogyTags = Tags( profiles: [.bittersweet, .spiritForward],
                                styles: [.oldFashioned, .stirred])

