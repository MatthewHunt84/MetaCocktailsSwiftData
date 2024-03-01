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

var stagPartySpec = [CocktailIngredient(.otherNonAlc(.stiffCream), value: 1, unit: .fluidOuncesFloated),
                     CocktailIngredient(.liqueurs(.licor43), value: 0.5),
                     CocktailIngredient(.amari(.sfumato), value: 0.25),
                     CocktailIngredient(.amari(.jagerColdBrew), value: 1),
                     CocktailIngredient(.whiskies(.stagJr), value: 1.5)]

var stagPartyTags = Tags(profiles: [.rich, .bittersweet, .punchy, .spiritForward],
                         styles: [.negroni, .stirred])
