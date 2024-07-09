//
//  EasternDiplomat.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation


var easternDiplomat = Cocktail(cocktailName: "Eastern Diplomat",
                               glasswareType: .coupe,
                               garnish: nil,
                               ice: nil,
                               author: Author(person: AuthorNames.kennyRemster.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue, year: "2018"),
                               spec: easternDiplomatSpec,
                               buildOrder: easternDiplomatBuild,
                               tags: easternDiplomatTags,
                               collection: .williamsAndGraham)

var easternDiplomatSpec  = [OldCocktailIngredient(.otherAlcohol(.absinthe), value: 5, unit: .sprays),
                            OldCocktailIngredient(.amari(.amaroMontenegro), value: 0.75),
                            OldCocktailIngredient(.amari(.nardiniAmaro), value: 0.75),
                            OldCocktailIngredient(.rums(.diplomaticoExclusivaRum), value: 0.75),
                            OldCocktailIngredient(.whiskies(.rittenhouseRye), value: 0.75)]

var easternDiplomatTags = Tags(profiles: [.rich, .bittersweet, .punchy, .spiritForward],
                               styles: [.martini, .stirred])

var easternDiplomatBuild  = Build(instructions: [Instruction(step: 1, method: "Combine all ingredients, except for the absinthe, into a mixing glass with ice and stir."),
                                                 Instruction(step: 2, method: "Rinse a coupe glass with absinthe."),
                                                 Instruction(step: 3, method: "Strain the cocktail into the prepared glass.")])
