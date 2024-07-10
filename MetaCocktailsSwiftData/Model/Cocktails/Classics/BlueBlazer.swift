//
//  BlueBlazer.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var blueBlazer = Cocktail(cocktailName: "Blue Blazer",
                          glasswareType: .toddyGlass,
                          garnish: [.lemonPeel],
                          author: jerryThomas,
                          spec: blueBlazerSpec,
                          buildOrder: blueBlazerBuild,
                          tags: blueBlazerTags,
                          collection: .originals)

var blueBlazerSpec  = [OldCocktailIngredient(.otherNonAlc(.hotWater), value: 2),
                       OldCocktailIngredient(.otherNonAlc(.sugarCube), value: 2, unit: .whole),
                       OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                       OldCocktailIngredient(.whiskies(.aberlourAbundah), value: 2)]

var blueBlazerTags = Tags(flavors: [.lemon, .tea],
                          profiles: [.hot],
                          styles: [.toddy])

var blueBlazerBuild = Build(instructions: [Instruction(step: 1, method: "Heat your Blue Blazer mugs and toddy glass with boiling water. It helps to heat your whiskey up in a tin as well. Place the whiskey in the small tin in a large tin on top of the boiling water."),
                                           Instruction(step: 2, method: "after your glass is sufficiently warm, dump the old water and add 2 oz. of fresh hot water to your toddy glass."),
                                           Instruction(step: 3, method: "Add the bitters, lemon peel, and sugar cubes to the water in your toddy glass and muddle the cubes."),
                                           Instruction(step: 4, method: "Quickly, pour out the hot water from the blue blazer mugs leaving 2 oz. of hot water in one."),
                                           Instruction(step: 5, method: "Add the over-proof scotch to the hot water in one of the mugs. The trick here is to have a scotch that's over 54% ABV."),
                                           Instruction(step: 6, method: "tilt the mug and set ablaze."),
                                           Instruction(step: 7, method: "With the handles point towards your body, hold the mugs like you would hold a gun."),
                                           Instruction(step: 8, method: "Start the transfer of fiery liquid from one mug to the other slowly and with little distance between the two, gradually increasing the distance with each pull."),
                                           Instruction(step: 9, method: "After ten plus pulls, and when everyone is sufficiently dazzled, the toddy should be ready to transfer to your glass.")])
