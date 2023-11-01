//
//  BeckyWithTheGoodHair.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/24/23.
//

import SwiftUI

var beckyWithTheGoodHair = Cocktail(cocktailName: "Becky With The Good Hair",
                                    glasswareType: .stemmedGlassware,
                                    garnish: [.nutmeg],
                                    ice: nil,
                                    author: "Saydee Canada",
                                    spec: beckyWithTheGoodHairSpec,
                                    buildOrder: beckyWithTheGoodHairBuild,
                                    tags: beckyWithTheGoodHairTags)

var beckyWithTheGoodHairSpec  = [CocktailIngredient(.cognacVSOP, value: 0.75),
                                 CocktailIngredient(.becherovka, value: 0.75),
                                 CocktailIngredient(.fernetBrancaMenta, value: 0.75),
                                 CocktailIngredient(.cremeDeCacao, value: 0.75),
                                 CocktailIngredient(.egg, value: 1, unit: .whole)]

var beckyWithTheGoodHairBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients into a tin a dry shake to emulsify"),
                                          Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold."),
                                          Instruction(step: 3, method: "Immediately after shaking, pop the tin and double strain into a stemmed glass."),
                                          Instruction(step: 4, method: "Grate some nutmeg over the top.")])


var beckyWithTheGoodHairTags = Tags(textures: [.rich, .velvety], 
                                    styles: [.flip, .shaken],
                                    bases: [.cognacVSOP])
