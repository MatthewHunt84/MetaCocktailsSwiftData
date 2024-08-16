//
//  GirlyDrink.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation


var girlyDrink = Cocktail(cocktailName: "Girly Drink",
                          glasswareType: .stemmedGlassware,
                          garnish: [.orangePeel],
                          ice: nil,
                          author: Author(person: AuthorPlaces.williamsAndGraham.rawValue),
                          spec: girlyDrinkSpec,
                          tags: girlyDrinkTags,
                          collection: .williamsAndGraham)

var girlyDrinkSpec  = [OldCocktailIngredient(.bitters(.bittercubeJamaican1), value: 2, unit: .dashes),
                       OldCocktailIngredient(.amari(.campari), value: 0.5),
                       OldCocktailIngredient(.liqueurs(.strega), value: 0.5),
                       OldCocktailIngredient(.fortifiedWines(.dolinBlanc), value: 0.5),
                       OldCocktailIngredient(.whiskies(.oGD114), value: 1.5)]

var girlyDrinkTags = Tags(flavors: [.orange],
                          profiles: [.rich, .punchy, .bittersweet, .spiritForward],
                          styles: [.negroni, .stirred])
