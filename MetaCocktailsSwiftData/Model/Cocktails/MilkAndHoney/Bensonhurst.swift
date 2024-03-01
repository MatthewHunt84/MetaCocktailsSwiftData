//
//  Bensonhurst.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/29/24.
//

import Foundation

var bensonhurst = Cocktail(cocktailName: "Bensonhurst",
                           glasswareType: .coupe,
                           ice: nil,
                           author:Author(person: AuthorNames.chadSolomon.rawValue ,  place: AuthorPlaces.milkAndHoney.rawValue , year: "2006"),
                           spec: bensonhurstSpec,
                           tags: bensonhurstTags,
                           collection: .milkAndHoney)

var bensonhurstSpec     =  [CocktailIngredient(.amari(.cynar), value: 1, unit: .teaspoon),
                            CocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 2, unit: .teaspoon),
                            CocktailIngredient(.fortifiedWines(.dolinDry), value: 1),
                            CocktailIngredient(.whiskies(.rittenhouseRye), value: 2)]

var bensonhurstTags     = Tags(profiles: [.spiritForward, .dry, .complex],
                               styles: [.manhattan, .stirred])
