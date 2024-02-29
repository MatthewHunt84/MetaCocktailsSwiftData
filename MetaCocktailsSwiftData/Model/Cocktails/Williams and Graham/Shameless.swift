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
                         tags: shamelessTags)

let shamelessSpec: [CocktailIngredient] = [CocktailIngredient(.bitters(.orangeBitters), value: 3, unit: .dashes),
                                           CocktailIngredient(.syrups(.honeySyrup), value: 1, unit: .barSpoon, prep: PrepBible.honeySyrup),
                                           CocktailIngredient(.amari(.suze), value: 0.25),
                                           CocktailIngredient(.liqueurs(.benedictine), value: 0.5),
                                           CocktailIngredient(.amari(.cynar), value: 0.75),
                                           CocktailIngredient(.whiskies(.balconesRye), value: 1.5)]


let shamelessTags = Tags(profiles: [.punchy, .herbal, .spiritForward, .bittersweet],
                         styles: [.stirred, .oldFashioned])
