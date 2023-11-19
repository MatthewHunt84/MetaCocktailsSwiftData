//
//  BlackberrySageSmash.swift
//  MetaCocktails
//
//  Created by Matt Hunt on 9/1/23.
//

import SwiftUI

var blackberrySageSmash = Cocktail(cocktailName: "Blackberry Sage Smash", 
                                   imageAsset: nil,
                                   glasswareType: .doubleOld,
                                   garnish: [.skeweredBlackberryAndSage],
                                   ice: .koldDraft, author: "Sean Kenyon",
                                   spec: blackberrySageSmashSpec,
                                   buildOrder: blackberrySageSmashBuild,
                                   tags: blackberrySageSmashTags)

let blackberrySageSmashTags = Tags(flavors: [.lemon], 
                                   profiles: [.fruity],
                                   textures: [.light],
                                   styles: [.sour, .shaken],
                                   bases: [.ryeWhiskey, .bourbon, .straightRyeOrBourbon])

let blackberrySageSmashSpec: [CocktailIngredient] = [CocktailIngredient(.ryeWhiskey, value: 2),
                                                     CocktailIngredient(.lemon, value: 0.75),
                                                     CocktailIngredient(.simple, value: 0.75),
                                                     CocktailIngredient(.blackBerry, value: 4, unit: .berries),
                                                     CocktailIngredient(.sage, value: 4, unit: .leaves)]

let blackberrySageSmashBuild =  Build(instructions: [Instruction(step: 1, method: "In a tin, muddle 4 blackberries and a small pinch of sage."),
                                                     Instruction(step: 2, method: "Add your ingredients and shake with ice."),
                                                     Instruction(step: 3, method: "Double strain over crushed ice."),
                                                     Instruction(step: 4, method: "Garnish with blackberry and sage.")])

