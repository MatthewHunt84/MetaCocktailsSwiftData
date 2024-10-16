//
//  HeartOfGold.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation

var heartOfGold = Cocktail(cocktailName: "Heart of Gold",
                           glasswareType: .stemmedGlassware,
                           garnish: nil,
                           author: Author(person: "Justin Jenkins", place: AuthorPlaces.williamsAndGraham.rawValue, year: "2020"),
                           spec: heartOfGoldSpec,
                           buildOrder: heartOfGoldBuild,
                           tags: heartOfGoldTags,
                           collection: .williamsAndGraham)

let heartOfGoldSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.bitters(.pimentoBitters), value: 2, unit: .dashes),
                                             OldCocktailIngredient(.amari(.angosturaAmaro), value: 0.75),
                                             OldCocktailIngredient(.amari(.amaroNonino), value: 0.75),
                                             OldCocktailIngredient(.agaves(.mezcalDelMagueyVida), value: 0.75),
                                             OldCocktailIngredient(.agaves(.tequilaFortalezaRepo), value: 0.75),
                                             OldCocktailIngredient(.whiskies(.Ardbeg), value: 3, unit: .sprays)]


let heartOfGoldTags = Tags(profiles: [.rich],
                           styles: [.martini, .stirred])


var heartOfGoldBuild  = Build(instructions: [Instruction(step: 1, method: "Combine all ingredients, except for the Ardbeg Scotch, into a mixing glass with ice and stir."),
                                             Instruction(step: 2, method: "Rinse your stemmed glassware with the ardbeg."),
                                             Instruction(step: 3, method: "Strain the cocktail into the prepared glass.")])
