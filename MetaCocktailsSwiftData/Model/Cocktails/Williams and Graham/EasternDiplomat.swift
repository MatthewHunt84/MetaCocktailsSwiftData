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


