//
//  DarkCorners.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/3/24.
//

import Foundation

var darkCorners  =  Cocktail(cocktailName: "Dark Corners",
                             glasswareType: .doubleOld,
                             garnish: [.babiesBreath],
                             ice: .bigRock,
                             author:Author(person: "Alexander Hammes",
                                           place: AuthorPlaces.williamsAndGraham.rawValue, year: "Summer, 2022"),
                             spec: darkCornersSpec,
                             buildOrder: nil,
                             tags: darkCornersTags,
                             collection: .williamsAndGraham)

var darkCornersSpec = [OldCocktailIngredient(.seasoning(.saline), value: 3, unit: .drops, prep: PrepBible.fiveToOneSaline),
                       OldCocktailIngredient(.amari(.fernetBranca), value: 1, unit: .barSpoon),
                       OldCocktailIngredient(.liqueurs(.licor43), value: 0.25),
                       OldCocktailIngredient(.amari(.campari), value: 0.5),
                       OldCocktailIngredient(.amari(.cynar), value: 0.5),
                       OldCocktailIngredient(.whiskies(.hirschBourbon), value: 1.5)]

var darkCornersTags = Tags(profiles: [.punchy, .bittersweet, .complex, .spiritForward],
                           styles: [.negroni, .stirred])
