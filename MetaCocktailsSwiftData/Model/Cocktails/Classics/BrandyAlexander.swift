//
//  BrandyAlexander.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

let brandyAlexander = Cocktail(cocktailName: "Brandy Alexander",
                               glasswareType: .coupe,
                               garnish: [.nutmeg],
                               spec: brandyAlexanderSpec,
                               tags: brandyAlexanderTags)

var brandyAlexanderSpec: [CocktailIngredient] = [CocktailIngredient(.otherNonAlc(.cream), value: 1),
                                                 CocktailIngredient(.liqueurs(.cremeDeCacao), value:1),
                                                 CocktailIngredient(.brandies(.pFAmber), value: 1)]

var brandyAlexanderTags = Tags(profiles: [.sweet, .rich],
                               styles: [.shaken])

