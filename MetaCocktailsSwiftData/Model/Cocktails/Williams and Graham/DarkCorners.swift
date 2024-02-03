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
                             tags: darkCornersTags)

var darkCornersSpec = [CocktailIngredient(.seasoning(.saline), value: 3, unit: .drops),
                       CocktailIngredient(.amari(.fernetBranca), value: 1, unit: .barSpoon),
                       CocktailIngredient(.liqueurs(.licor43), value: 0.25),
                       CocktailIngredient(.amari(.campari), value: 0.5),
                       CocktailIngredient(.amari(.cynar), value: 0.5),
                       CocktailIngredient(.whiskies(.hirschBourbon), value: 1.5)]

var darkCornersTags = Tags(profiles: [.punchy, .bittersweet, .complex, .spiritForward],
                           styles: [.negroni, .stirred])
