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

var bensonhurstSpec     =  [OldCocktailIngredient(.amari(.cynar), value: 1, unit: .teaspoon),
                            OldCocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 2, unit: .teaspoon),
                            OldCocktailIngredient(.fortifiedWines(.dolinDry), value: 1),
                            OldCocktailIngredient(.whiskies(.rittenhouseRye), value: 2)]

var bensonhurstTags     = Tags(profiles: [.spiritForward, .dry, .complex],
                               styles: [.manhattan, .stirred])
