//
//  BurisBovineBeverage.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var burisBovineBev = Cocktail(cocktailName: "Buris' Bovine Beverage",
                              glasswareType: .singleOld,
                              garnish: [.stroopwaffle],
                              ice: nil,
                              author: Author(person: "Killian Hopkins",
                                             place: AuthorPlaces.williamsAndGraham.rawValue,
                                             year: "2018"),
                              spec: burisBovineBevSpec,
                              tags: burisBovineBevTags,
                              collection: .williamsAndGraham)

var burisBovineBevSpec  = [OldCocktailIngredient(.otherNonAlc(.cream), value: 0.75),
                           OldCocktailIngredient(.syrups(.demSyrupOneToOne), value: 0.25),
                           OldCocktailIngredient(.rums(.cruzanBlackstrap), value: 0.25),
                           OldCocktailIngredient(.rums(.plantationOFTD), value: 0.5),
                           OldCocktailIngredient(.amari(.nardiniAmaro), value: 1),
                           OldCocktailIngredient(.otherNonAlc(.eggWhole), value: 1, unit: .whole)]

var burisBovineBevTags = Tags(profiles: [.rich, .silky, .savory],
                              styles: [.flip, .shaken])
