//
//  Toronto.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/14/24.
//

import Foundation

var toronto = Cocktail(cocktailName: "Toronto",
                       glasswareType: .doubleOld,
                       garnish: [.orangePeel],
                       ice: .bigRock,
                       author: davidEmbury,
                       spec: torontoSpec,
                       tags: torontoTags,
                       variation: nil,
                       titleCocktail: true)

var torontoSpec  =  [CocktailIngredient(.syrups(.simple), value: 0.25),
                     CocktailIngredient(.amari(.fernetBranca), value: 0.5),
                     CocktailIngredient(.whiskies(.canadianWhiskeyAny), value: 1.5), 
                     CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dash)]

var torontoTags = Tags( profiles: [.bittersweet, .spiritForward],
                        styles: [.oldFashioned, .stirred])


