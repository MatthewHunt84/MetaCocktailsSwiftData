//
//  TheTieBinder.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/14/24.
//

import Foundation

var theTieBinder  = Cocktail(cocktailName: "The Tie Binder",
                             glasswareType: .flute,
                             garnish: nil,
                             ice: nil,
                             author: sashaPetraske,
                             spec: theTieBinderSpec,
                             buildOrder: theTieBinderBuild,
                             tags: theTieBinderTags,
                             variation: nil ,
                             collection: .milkAndHoney)

var theTieBinderSpec  = [ OldCocktailIngredient(.otherNonAlc(.whitePeachPure), value: 1.5, prep: PrepBible.whitePeachPuree),
                          OldCocktailIngredient(.gins(.monkey47), value: 1),
                          OldCocktailIngredient(.wines(.champagne) , value: 2)]

var theTieBinderBuild  = Build(instructions: [Instruction(step: 1, method: "Combine the puree and gin in a Champagne flute"),
                                              Instruction(step: 2, method: "Slowly top off with the Champagne, stirring gently to incorporate.")])

var theTieBinderTags   = Tags(profiles: [.fruity, .effervescent, .light],
                              styles: [.built, .fizz])

