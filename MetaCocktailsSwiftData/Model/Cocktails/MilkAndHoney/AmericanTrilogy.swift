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

var americanTrilogySpec  =  [CocktailIngredient(.otherNonAlc(.sugarCube), value: 1, unit: .muddled),
                             CocktailIngredient(.soda(.sodaWater), value: 1, unit: .splash),
                             CocktailIngredient(.bitters(.orangeBitters), value: 3, unit: .dashes),
                             CocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 1),
                             CocktailIngredient(.brandies(.lairdsBonded), value: 1)]

var americanTrilogyTags = Tags( profiles: [.bittersweet, .spiritForward],
                                styles: [.oldFashioned, .stirred])

var americanTrilogyBuild = Build(instructions: [Instruction(step: 1, method: "Add bitters, sugar cube, and a splash of soda into a double old fashioned glass and muddle. The soda is just to break down the sugar cube"),
                                                Instruction(step: 2, method: "Add the rye and laird's bonded into the glass."),
                                                Instruction(step: 3, method: "Then, with the back end of a barspoon, giude a large rock into the glass so that it doesn't make a splash and stir."),
                                                Instruction(step: 4, method: "Stir unti chilled and then garnish with an orange peel")])
