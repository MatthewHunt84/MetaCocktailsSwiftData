////
////  BlackberrySageSmash.swift
////  MetaCocktails
////
////  Created by Matt Hunt on 9/1/23.
////

import SwiftUI

var blackberrySageSmash = Cocktail(cocktailName: "Blackberry Sage Smash", 
                                   imageAsset: nil,
                                   glasswareType: .doubleOld,
                                   garnish: [.skeweredBlackberryAndSage],
                                   ice: .koldDraft, author: "Sean Kenyon",
                                   spec: blackberrySageSmashSpec,
                                   buildOrder: blackberrySageSmashBuild,
                                   tags: blackberrySageSmashTags)

let blackberrySageSmashSpec: [CocktailIngredient] = [CocktailIngredient(.whiskies(.ryeWhiskey), value: 2),
                                                     CocktailIngredient(.juices(.lemon), value: 0.75),
                                                     CocktailIngredient(.syrups(.simple), value: 0.75),
                                                     CocktailIngredient(.fruit(.blackBerry), value: 4, unit: .berries),
                                                     CocktailIngredient(.herbs(.sage), value: 4, unit: .leaves)]

let blackberrySageSmashTags = Tags(flavors: [.lemon],
                                   profiles: [.fruity],
                                   textures: [.light],
                                   styles: [.sour, .shaken])

let blackberrySageSmashBuild =  Build(instructions: [Instruction(step: 1, method: "In a tin, muddle 4 blackberries and a small pinch of sage."),
                                                     Instruction(step: 2, method: "Add your ingredients and shake with ice."),
                                                     Instruction(step: 3, method: "Double strain over crushed ice."),
                                                     Instruction(step: 4, method: "Garnish with blackberry and sage.")])

