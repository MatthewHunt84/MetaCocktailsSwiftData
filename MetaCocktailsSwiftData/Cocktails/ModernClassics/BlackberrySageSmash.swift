//
//  BlackberrySageSmash.swift
//  MetaCocktails
//
//  Created by Matt Hunt on 9/1/23.
//

import SwiftUI
import UIKit


var blackberrySageSmash = Cocktail(name: "Blackberry Sage Smash",
                                   imageName: "BBSSNoBackground",
                                   glasswareType: .doubleOld,
                                   garnish: [GarnishCatalog.skeweredBlackberryAndSage.asset],
                                   author: "Sean Kenyon",
                                   spec: blackberrySageSmashSpec,
                                   buildOrder: blackberrySageSmashBuild,
                                   tags: blackberrySageSmashTags)


var blackberrySageSmashSpec: [CocktailIngredient] = [CocktailIngredient(name: .blackBerry, value: 4, unit: .berries),
                                                     CocktailIngredient(name: .sage, value: 4, unit: .leaves),
                                                     CocktailIngredient(name: .lemon, value: 0.75),
                                                     CocktailIngredient(name: .simple, value: 0.75),
                                                     CocktailIngredient(name: .ryeWhiskey, value: 2, unit: .fluidOunces)]


let blackberrySageSmashBuild =  Build(instructions: [Instruction(step: 1, method: "In a tin, muddle 4 blackberries and a small pinch of sage."),
                                                     Instruction(step: 2, method: "Add your ingredients and shake with ice."),
                                                     Instruction(step: 3, method: "Double strain over crushed ice."),
                                                     Instruction(step: 4, method: "Garnish with blackberry and sage.")])

var blackberrySageSmashTags = Tags(flavors: [.lemon, .blackberry, .sage], 
                                   profiles: [.citrusy, .fruity, .herbal],
                                   textures: [.light],
                                   styles: [.sour, .shaken],
                                   baseComponents: [.ryeWhiskey])

