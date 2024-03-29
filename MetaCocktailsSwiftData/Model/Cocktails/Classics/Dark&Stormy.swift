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

var darkNStormySpec  = [CocktailIngredient(.soda(.gingerBeer), value: 4),
                        CocktailIngredient(.juices(.lime), value: 0.5),
                        CocktailIngredient(.rums(.goslingsBlackSeal), value: 2)]



var darkNStormyTags   = Tags(profiles: [.refreshing, .light, .effervescent],
                             styles: [.fizz, .built])

var darkNStormyBuild = Build(instructions: [Instruction(step: 1, method: "Build in glass starting with the ice, ginger beer, and lime. "), 
                                            Instruction(step: 2, method: "Float the dark rum and add a lime wheel for garnnish.")])
