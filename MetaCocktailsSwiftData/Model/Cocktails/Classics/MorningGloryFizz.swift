//
//  MorningGloryFizz.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var morningGloryFizz = Cocktail(cocktailName: "Morning Glory Fizz(1884)",
                                glasswareType: .collins,
                                garnish: nil ,
                                ice: nil,
                                author: oHByron,
                                spec: morningGloryFizzSpec,
                                buildOrder: morningGloryFizzBuild,
                                tags: morningGloryFizzTags,
                                variation: .morningGloryFizz)

var morningGloryFizzSpec = [CocktailIngredient(.soda(.sodaWater), value: 2),
                            CocktailIngredient(.juices(.lemon), value: 5, unit: .dashes),
                            CocktailIngredient(.juices(.lime), value: 3, unit: .dashes),
                            CocktailIngredient(.otherAlcohol(.absinthe), value: 4, unit: .dashes),
                            CocktailIngredient(.otherNonAlc(.granulatedSugar), value: 1, unit: .tablespoon),
                            CocktailIngredient(.otherNonAlc(.eggWhites), value: 1.25),
                            CocktailIngredient(.whiskies(.scotchAny), value: 2)]

var morningGloryFizzTags = Tags(profiles: [.citrusy, .light, .silky, .refreshing, .fruity, .restorative],
                                styles: [.sour, .shaken])

var morningGloryFizzBuild = Build(instructions: [Instruction(step: 1, method: "'Shake well in shaker and strain; fill balance of glass with seltzer or Vichy water'"),
                                                 Instruction(step: 1, method: "'To be drank immediately, or the effect will be lost. Ot is a morning beverage, a tonic and a nerve quieter. -O.H. Byron'")])
