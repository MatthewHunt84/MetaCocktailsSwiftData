////
////  BeckyWithTheGoodHair.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/24/23.
////

import SwiftUI

var beckyWithTheGoodHair = Cocktail(cocktailName: "Becky With The Good Hair",
                                    glasswareType: .snifter,
                                    garnish: [.nutmeg],
                                    ice: nil,
                                    author: Author(person: AuthorNames.saydeeCanada.rawValue,
                                                   place: AuthorPlaces.williamsAndGraham.rawValue,
                                                   year: "2016"),
                                    spec: beckyWithTheGoodHairSpec,
                                    buildOrder: beckyWithTheGoodHairBuild,
                                    tags: beckyWithTheGoodHairTags)

var beckyWithTheGoodHairSpec  = [CocktailIngredient(.brandies(.cognacVSOP), value: 0.75),
                                 CocktailIngredient(.amari(.becherovka), value: 0.75),
                                 CocktailIngredient(.amari(.fernetBrancaMenta), value: 0.75),
                                 CocktailIngredient(.liqueurs(.cremeDeCacao), value: 0.75),
                                 CocktailIngredient(.otherNonAlc(.eggWhole), value: 1, unit: .whole)]

var beckyWithTheGoodHairTags = Tags(flavors: [.nutmeg],
                                    profiles: [.rich, .silky, .savory],
                                    styles: [.flip, .shaken])

var beckyWithTheGoodHairBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients into a tin a dry shake to emulsify"),
                                          Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold."),
                                          Instruction(step: 3, method: "Immediately after shaking, pop the tin and double strain into a stemmed glass."),
                                          Instruction(step: 4, method: "Grate some nutmeg over the top.")])
