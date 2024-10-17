//
//  MajorBailey.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var majorBailey = Cocktail(cocktailName: "Major Bailey",
                           glasswareType: .fizzGlass,
                           garnish: [.mintSprig],
                           ice: .pebbleIce,
                           author: traderVic1947,
                           spec: majorBaileySpec,
                           buildOrder: majorBaileyBuild,
                           tags: majorBaileyTags,
                           variation: .majorBailey,
                           collection: .originals,
                           titleCocktail: true)

let majorBaileySpec: [OldCocktailIngredient] = [OldCocktailIngredient(.herbs(.mint), value: 12, unit: .gentlyMuddled),
                                                OldCocktailIngredient(.juices(.lemon), value: 0.25),
                                                OldCocktailIngredient(.juices(.lime), value: 0.25),
                                                OldCocktailIngredient(.syrups(.richSimple), value: 0.5, prep: PrepBible.richSimple),
                                                OldCocktailIngredient(.gins(.haymansLondonDry), value: 2)]


let majorBaileyTags = Tags(profiles: [.herbal, .refreshing, .light, .restorative],
                           styles: [.sour, .shaken])

let majorBaileyBuild =  Build(instructions: [Instruction(step: 1, method: "Use Kold draft or Hoshizake cubes and the mint will the muddled while you're shaking."),
                                             Instruction(step: 2, method: "Double strain the shaken cocktail over ice in the glass."),
                                             Instruction(step: 3, method: "Garnish with a mint sprig.")])

