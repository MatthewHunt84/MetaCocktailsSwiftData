//
//  AlexanderCocktail.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/18/24.
//

import Foundation

let alexanderCocktail = Cocktail(cocktailName: "Alexander Cocktail",
                                 glasswareType: .coupe,
                                 garnish: nil,
                                 author: hugoEnsslin,
                                 spec: alexanderCocktailSpec,
                                 tags: alexanderCocktailTags,
                                 variation: .alexander,
                                 collection: .originals,
                                 titleCocktail: true)

var alexanderCocktailSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.otherNonAlc(.cream), value: 1),
                                                      OldCocktailIngredient(.liqueurs(.cremeDeCacao), value:1),
                                                      OldCocktailIngredient(.gins(.ginLondonDry), value: 1)]

var alexanderCocktailTags = Tags(profiles: [.sweet, .rich],
                                 styles: [.shaken])

