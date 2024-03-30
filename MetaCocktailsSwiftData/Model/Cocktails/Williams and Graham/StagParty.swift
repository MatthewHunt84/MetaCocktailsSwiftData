//
//  StagParty.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var stagParty  =  Cocktail(cocktailName: "Stag Party",
                           glasswareType: .singleOld,
                           garnish: [.orangePeel],
                           ice: nil ,
                           author:Author(person: AuthorNames.jamesMenkal.rawValue,
                                         place: AuthorPlaces.williamsAndGraham.rawValue, year: "2020"),
                           spec: stagPartySpec,
                           buildOrder: nil,
                           tags: stagPartyTags,
                           collection: .williamsAndGraham)

var stagPartySpec = [CocktailIngredient(.otherNonAlc(.stiffCream), value: 1),
                     CocktailIngredient(.liqueurs(.licor43), value: 0.5),
                     CocktailIngredient(.amari(.sfumato), value: 0.25),
                     CocktailIngredient(.amari(.jagerColdBrew), value: 1),
                     CocktailIngredient(.whiskies(.stagJr), value: 1.5)]

var stagPartyTags = Tags(profiles: [.rich, .bittersweet, .punchy, .spiritForward],
                         styles: [.negroni, .stirred])

var stagPartyBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, besides the cream, to a mixing glass and stir."),
                                          Instruction(step: 2, method: "Strain into a frozen single old fashioned glass."),
                                          Instruction(step: 3, method: "Float the stiff cream on top and garnish with an orange peel.")])
