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

var girlyDrinkSpec  = [CocktailIngredient(.bitters(.bittercubeJamaican1), value: 2, unit: .dashes),
                       CocktailIngredient(.amari(.campari), value: 0.5),
                      CocktailIngredient(.liqueurs(.strega), value: 0.5),
                      CocktailIngredient(.fortifiedWines(.dolinBlanc), value: 0.5),
                      CocktailIngredient(.whiskies(.oGD114), value: 1.5)]

var girlyDrinkTags = Tags(profiles: [.rich, .punchy, .bittersweet, .spiritForward],
                         styles: [.negroni, .stirred])
