//
//  BrandyAlexander.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

let brandyAlexander = Cocktail(cocktailName: "Alexander Cocktail No. 2",
                               glasswareType: .coupe,
                               garnish: nil,
                               author: harryCraddock,
                               spec: brandyAlexanderSpec,
                               tags: brandyAlexanderTags,
                               variation: .alexander,
                               collection: .originals)

var brandyAlexanderSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.otherNonAlc(.cream), value: 1),
                                                    OldCocktailIngredient(.liqueurs(.cremeDeCacao), value:1),
                                                    OldCocktailIngredient(.brandies(.brandyAny), value: 1)]

var brandyAlexanderTags = Tags(profiles: [.sweet, .rich],
                               styles: [.shaken])

