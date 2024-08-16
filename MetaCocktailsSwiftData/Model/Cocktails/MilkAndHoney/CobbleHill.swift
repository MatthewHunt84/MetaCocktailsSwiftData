//
//  CobbleHill.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/29/24.
//

import Foundation

var cobbleHill = Cocktail(cocktailName: "Cobble Hill",
                          glasswareType: .coupe,
                          garnish: [.cucumberSlices],
                          ice: nil,
                          author:Author(person: AuthorNames.samRoss.rawValue ,  place: AuthorPlaces.milkAndHoney.rawValue , year: "Early 2000s"),
                          spec: cobbleHillSpec,
                          buildOrder: cobbleHillBuild,
                          tags: cobbleHillTags,
                          collection: .milkAndHoney)

var cobbleHillSpec     =  [OldCocktailIngredient(.fruit(.cucumberSlices), value: 2, unit: .gentlyMuddled),
                           OldCocktailIngredient(.fortifiedWines(.dolinDry), value: 0.5),
                           OldCocktailIngredient(.amari(.amaroMontenegro), value: 0.5),
                           OldCocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 2)]

var cobbleHillTags     = Tags(profiles: [.spiritForward, .floral, .dry],
                              styles: [.manhattan, .stirred])

var cobbleHillBuild = Build(instructions: [Instruction(step: 1, method: "Gently muddle two cucumber slices in a mixing glass."),
                                           Instruction(step: 2, method: "Add the rest of the ingredients with ice and stir."),
                                           Instruction(step: 3, method: "Strain into a chilled coupe and garnish with a cucumber slice.")])
