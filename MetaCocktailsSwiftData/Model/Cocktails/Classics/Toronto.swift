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

var torontoSpec  =  [OldCocktailIngredient(.syrups(.simple), value: 0.25, prep: PrepBible.simpleSyrupPrep),
                     OldCocktailIngredient(.amari(.fernetBranca), value: 0.5),
                     OldCocktailIngredient(.whiskies(.canadianWhiskeyAny), value: 1.5), 
                     OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes)]

var torontoTags = Tags(flavors: [.orange],
                       profiles: [.bittersweet, .spiritForward],
                       styles: [.oldFashioned, .stirred])


