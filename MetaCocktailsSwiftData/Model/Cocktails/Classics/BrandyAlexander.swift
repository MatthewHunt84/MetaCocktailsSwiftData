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

var brandyAlexanderSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.otherNonAlc(.cream), value: 1),
                                                 OldCocktailIngredient(.liqueurs(.cremeDeCacao), value:1),
                                                 OldCocktailIngredient(.brandies(.pFAmber), value: 1)]

var brandyAlexanderTags = Tags(profiles: [.sweet, .rich],
                               styles: [.shaken])

