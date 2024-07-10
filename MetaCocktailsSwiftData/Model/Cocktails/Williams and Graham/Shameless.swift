//
//  Shameless.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var shameless = Cocktail(cocktailName: "Shameless",
                         imageAsset: nil,
                         glasswareType: .doubleOld,
                         garnish: [.flamedOrange, .honeycomb],
                         ice: .bigRock,
                         author: Author(person: "Lauren", place: AuthorPlaces.williamsAndGraham.rawValue, year: "2019"),
                         spec: shamelessSpec,
                         tags: shamelessTags,
                         collection: .williamsAndGraham)

let shamelessSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.bitters(.orangeBitters), value: 3, unit: .dashes),
                                           OldCocktailIngredient(.syrups(.honeySyrup), value: 1, unit: .barSpoon, prep: PrepBible.honeySyrup),
                                           OldCocktailIngredient(.amari(.suze), value: 0.25),
                                           OldCocktailIngredient(.liqueurs(.benedictine), value: 0.5),
                                           OldCocktailIngredient(.amari(.cynar), value: 0.75),
                                           OldCocktailIngredient(.whiskies(.balconesRye), value: 1.5)]


let shamelessTags = Tags(profiles: [.punchy, .herbal, .spiritForward, .bittersweet],
                         styles: [.stirred, .oldFashioned])
