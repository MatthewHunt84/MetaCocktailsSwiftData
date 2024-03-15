//
//  SouthSideFizz.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/14/24.
//

import Foundation

var southSideFizz = Cocktail(cocktailName: "South Side Fizz",
                             imageAsset: nil,
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

let southSideFizzSpec: [CocktailIngredient] = [CocktailIngredient(.herbs(.mint), value: 10, unit: .gentlyMuddled),
                                               CocktailIngredient(.juices(.lime), value: 0.5),
                                               CocktailIngredient(.juices(.lemon), value: 0.5),
                                               CocktailIngredient(.otherNonAlc(.powderedSugar), value: 1, unit: .tablespoon),
                                               CocktailIngredient(.gins(.ginAny), value: 1.5),
                                               CocktailIngredient(.soda(.sparklingWater), value: 2)]

let southSideFizzTags = Tags(profiles: [.herbal, .refreshing, .light, .effervescent],
                             styles: [.fizz, .shaken])

let southSideFizzBuild =  Build(instructions: [Instruction(step: 1, method: "Shake all of the ingredients except for the soda in a tin. Use Kold draft of Hoshizake cubes and the mint will the muddled while you're shaking."),
                                               Instruction(step: 2, method: "Add soda to the glass."),
                                               Instruction(step: 3, method: "Double strain the shaken cocktail over the soda.")])

