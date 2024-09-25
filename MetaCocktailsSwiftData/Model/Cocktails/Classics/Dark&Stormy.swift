//
//  Dark&Stormy.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var darkNStormy  = Cocktail(cocktailName: "Dark & Stormy",
                            glasswareType: .collins,
                            garnish: [.limeWheel],
                            ice: .koldDraft,
                            spec: darkNStormySpec,
                            buildOrder: darkNStormyBuild,
                            tags: darkNStormyTags)

var darkNStormySpec  = [OldCocktailIngredient(.soda(.gingerBeer), value: 4, prep: PrepBible.gingerBeer),
                        OldCocktailIngredient(.juices(.lime), value: 0.5),
                        OldCocktailIngredient(.rums(.goslingsBlackSeal), value: 2)]



var darkNStormyTags   = Tags(profiles: [.refreshing, .light, .effervescent],
                             styles: [.fizz, .built])

var darkNStormyBuild = Build(instructions: [Instruction(step: 1, method: "Build in glass starting with the ice, ginger beer, and lime. "), 
                                            Instruction(step: 2, method: "Float the dark rum and add a lime wheel for garnish.")])

var darkAndStormyNotes = " \"The drink might have been invented by British sailors on shore leave in Bermuda after World War I. Though, in 1991, the Gosling family, which founded Gosling's in Bermuda in 1806, claimed a trademark for the recipe...\" -David Wondrich, The Oxford Companion to Spirits and Cocktails"
