//
//  RyeHummingbirdDown.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/12/24.
//

import Foundation

var ryeHummingbirdDown  = Cocktail(cocktailName: "Rye Hummingbird Down",
                                   glasswareType: .coupe,
                                   garnish: nil,
                                   author: Author(person: AuthorNames.marcosTello.rawValue,
                                                  place: AuthorPlaces.milkAndHoney.rawValue,
                                                  year: "Early 2000s"),
                                   spec: ryeHummingbirdDownSpec,
                                   tags: ryeHummingbirdDownTags,
                                   variation: nil,
                                   collection: .milkAndHoney)

var ryeHummingbirdDownSpec  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                               CocktailIngredient(.syrups(.honeySyrup), value: 0.75, prep: PrepBible.honeySyrup),
                               CocktailIngredient(.liqueurs(.greenChartreuse), value: 1, unit: .teaspoon),
                               CocktailIngredient(.whiskies(.ryeWhiskeyAny) , value: 2)]


var ryeHummingbirdDownTags   = Tags(profiles: [.citrusy, .refreshing, .light],
                                    styles: [.shaken, .sour])

