//
//  WilliamsCross.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var williamsCross  =  Cocktail(cocktailName: "William's Cross",
                               glasswareType: .stemmedGlassware,
                               garnish: [.orangePeel],
                               author:Author(place: AuthorPlaces.williamsAndGraham.rawValue),
                               spec: williamsCrossSpec,
                               buildOrder: nil,
                               tags: williamsCrossTags,
                               collection: .williamsAndGraham)

var williamsCrossSpec = [CocktailIngredient(.bitters(.orangeBitters), value: 2, unit: .dashes),
                         CocktailIngredient(.amari(.amaroNonino), value: 0.25),
                         CocktailIngredient(.fortifiedWines(.lustauPX), value: 0.25),
                         CocktailIngredient(.fortifiedWines(.dolinRouge), value: 0.5),
                         CocktailIngredient(.whiskies(.tullamoreDew12), value: 2)]

var williamsCrossTags = Tags(profiles: [.rich, .bittersweet, .punchy, .complex],
                             styles: [.manhattan, .stirred])
