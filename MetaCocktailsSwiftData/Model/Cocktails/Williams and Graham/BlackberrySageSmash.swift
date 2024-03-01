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
                                   ice: .koldDraft,
                                   author:Author(person: AuthorNames.seanKenyon.rawValue,
                                                 place: AuthorPlaces.williamsAndGraham.rawValue,
                                                 year: "2011") ,
                                   spec: blackberrySageSmashSpec,
                                   buildOrder: blackberrySageSmashBuild,
                                   tags: blackberrySageSmashTags,
                                   collection: .williamsAndGraham)

let blackberrySageSmashSpec: [CocktailIngredient] = [CocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 2),
                                                     CocktailIngredient(.juices(.lemon), value: 0.75),
                                                     CocktailIngredient(.syrups(.simple), value: 0.75),
                                                     CocktailIngredient(.fruit(.blackBerry), value: 4, unit: .muddled),
                                                     CocktailIngredient(.herbs(.sage), value: 4, unit: .gentlyMuddled)]

let blackberrySageSmashTags = Tags(flavors: [.lemon],
                                   profiles: [.fruity, .light, .herbal],
                                   styles: [.sour, .shaken])

let blackberrySageSmashBuild =  Build(instructions: [Instruction(step: 1, method: "In a tin, muddle 4 blackberries and a small pinch of sage."),
                                                     Instruction(step: 2, method: "Add your ingredients and shake with ice."),
                                                     Instruction(step: 3, method: "Double strain over crushed ice."),
                                                     Instruction(step: 4, method: "Garnish with blackberry and sage.")])

