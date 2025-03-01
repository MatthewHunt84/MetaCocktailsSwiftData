//
//  MorningGloryFizz.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var morningGloryFizz = Cocktail(cocktailName: "Morning Glory Fizz",
                                glasswareType: .collins,
                                garnish: nil ,
                                ice: nil,
                                author: oHByron,
                                spec: morningGloryFizzSpec,
                                buildOrder: morningGloryFizzBuild,
                                notes: morningGloryFizzNote,
                                tags: morningGloryFizzTags,
                                variation: .morningGloryFizz,
                                collection: .originals,
                                titleCocktail: true)

var morningGloryFizzSpec = [OldCocktailIngredient(.soda(.sodaWater), value: 2),
                            OldCocktailIngredient(.juices(.lemon), value: 5, unit: .dashes),
                            OldCocktailIngredient(.juices(.lime), value: 3, unit: .dashes),
                            OldCocktailIngredient(.otherAlcohol(.absinthe), value: 4, unit: .dashes),
                            OldCocktailIngredient(.otherNonAlc(.granulatedSugar), value: 1, unit: .tablespoon),
                            OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 1.25),
                            OldCocktailIngredient(.whiskies(.scotchAny), value: 2)]

var morningGloryFizzTags = Tags(profiles: [.citrusy, .light, .silky, .refreshing, .fruity, .restorative],
                                styles: [.sour, .shaken])


