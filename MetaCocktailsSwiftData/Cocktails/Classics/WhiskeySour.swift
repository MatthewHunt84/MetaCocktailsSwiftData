//
//  WhiskeySour.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/24/23.
//

import SwiftUI

var whiskeySour = Cocktail(cocktailName: "Whiskey Sour",
                           glasswareType: .stemmedGlassware,
                           garnish: [.maraschinoCherry],
                           ice: nil,
                           author: nil,
                           spec: whiskeySourSpec,
                           buildOrder: whiskeySourBuild,
                           tags: whiskeySourTags)

var whiskeySourSpec  = [CocktailIngredient(.lemon, value: 0.75),
                        CocktailIngredient(.simple, value: 0.75),
                        CocktailIngredient(.eggWhites, value: 0.75),
                        CocktailIngredient(.straightRyeOrBourbon, value: 0.75),
                        CocktailIngredient(.angosturaBitters, value: 2, unit: .dashes)]

var whiskeySourBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients accept for the bitters into a tin a dry shake to emulsify"),
                                          Instruction(step: 2, method: "And a few Kold Draft cubes and shake until cold. Do not over dilute"),
                                          Instruction(step: 3, method: "Immediately after shaking (with vigor), pop the tin and double strain very carefully into a stemmed glass. Create the least amount of turbulence here so that you create a smooth and even surface for the design with the bitters. The bitters are optional here. But we think it adds a bit off needed complexity to the cocktail."),
                                          Instruction(step: 4, method: "Wait about 30 seconds after you stain out the cocktail to make the design over the top. It helps for the egg whites to settle for a bit to give you a better and more even canvas to work with.")])


var whiskeySourTags = Tags(textures: [.light, .velvety],
                           styles: [.sour, .shaken],
                           bases: [.straightRyeOrBourbon, .bourbon, .ryeWhiskey])
