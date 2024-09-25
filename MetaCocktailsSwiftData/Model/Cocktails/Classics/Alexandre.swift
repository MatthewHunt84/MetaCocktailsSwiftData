//
//  Alexandre.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/18/24.
//

import Foundation

let alexandre = Cocktail(cocktailName: "Alexandre",
                         glasswareType: .coupe,
                         garnish: nil,
                         author: stanleyArthur,
                         spec: alexandreSpec,
                         tags: alexandreTags,
                         variation: .alexander,
                         collection: .originals,
                         titleCocktail: false)

var alexandreSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 1),
                                              OldCocktailIngredient(.otherNonAlc(.cream), value: 1),
                                              OldCocktailIngredient(.liqueurs(.cremeDeCacao), value:1),
                                              OldCocktailIngredient(.gins(.ginLondonDry), value: 1)]

var alexandreTags = Tags(profiles: [.sweet, .rich, .silky],
                         styles: [.shaken])

