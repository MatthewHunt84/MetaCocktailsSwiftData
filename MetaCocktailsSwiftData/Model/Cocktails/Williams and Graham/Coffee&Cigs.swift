//
//  Coffee&Cigs.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var coffeeAndCigs = Cocktail(cocktailName: "Coffee & Cigs",
                             glasswareType: .doubleOld,
                             garnish: [.nutmeg],
                             ice: .bigRock,
                             author:Author(person: AuthorNames.allisonWiddecombe.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue),
                             spec: coffeeAndCigsSpec,
                             buildOrder: coffeeAndCigsBuild,
                             tags: coffeeAndCigsTags,
                             collection: .williamsAndGraham)

var coffeeAndCigsSpec  = [OldCocktailIngredient(.otherNonAlc(.stiffCream), value: 1),
                          OldCocktailIngredient(.liqueurs(.borghetti), value: 1),
                          OldCocktailIngredient(.amari(.averna), value: 0.5),
                          OldCocktailIngredient(.whiskies(.buffaloTrace), value: 1.5)]

var coffeeAndCigsTags = Tags(flavors: [.nutmeg],
                             profiles: [.punchy, .rich, .bittersweet],
                             styles: [.oldFashioned, .stirred, .built])


