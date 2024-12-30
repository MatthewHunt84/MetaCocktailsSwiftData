//
//  SouthSideFizz.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/14/24.
//

import Foundation

var southSideFizz = Cocktail(cocktailName: "South Side Fizz",
                             glasswareType: .fizzGlass,
                             garnish: nil,
                             ice: nil,
                             author: hugoEnsslin,
                             spec: southSideFizzSpec,
                             buildOrder: southSideFizzBuild,
                             tags: southSideFizzTags,
                             variation: .southSide,
                             collection: .originals,
                             titleCocktail: true)

let southSideFizzSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.herbs(.mint), value: 10, unit: .gentlyMuddled),
                                               OldCocktailIngredient(.juices(.lime), value: 0.5),
                                               OldCocktailIngredient(.juices(.lemon), value: 0.5),
                                               OldCocktailIngredient(.otherNonAlc(.powderedSugar), value: 1, unit: .tablespoon),
                                               OldCocktailIngredient(.gins(.ginAny), value: 1.5),
                                               OldCocktailIngredient(.soda(.sparklingWater), value: 2)]

let southSideFizzTags = Tags(profiles: [.herbal, .refreshing, .light, .effervescent],
                             styles: [.fizz, .shaken])



