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
                               tags: easternDiplomatTags)

var easternDiplomatSpec  = [CocktailIngredient(.otherAlcohol(.absinthe), value: 1, unit: .glassRinse),
                            CocktailIngredient(.amari(.amaroMontenegro), value: 0.75),
                            CocktailIngredient(.amari(.nardiniAmaro), value: 0.75),
                            CocktailIngredient(.rums(.diplomaticoExclusivaRum), value: 0.75),
                            CocktailIngredient(.whiskies(.rittenhouseRye), value: 0.75)]

var easternDiplomatTags = Tags(profiles: [.rich, .bittersweet, .punchy, .spiritForward],
                               styles: [.martini, .stirred])
