////
////  CloverClub.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/24/23.
////

import SwiftUI

var cloverClub = Cocktail(cocktailName: "Clover Club",
                           glasswareType: .stemmedGlassware,
                           garnish: [.raspberry],
                           ice: nil,
                           author: Author(place: "Somewhere in Philadelphia", year: "1901"),
                           spec: cloverClubSpec,
                           buildOrder: cloverClubBuild,
                           tags: cloverClubTags)

var cloverClubSpec  = [CocktailIngredient(.juices(.lemon), value: 0.5),
                       CocktailIngredient(.syrups(.raspberrySyrup), value: 0.5),
                       CocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                       CocktailIngredient(.fortifiedWines(.dryVermouthAny), value: 0.5),
                       CocktailIngredient(.gins(.ginAny), value: 1.5)]

var cloverClubBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients into a tin a dry shake to emulsify. If you don't feel like making a raspberry syrup (we recommend Julie Reiner's version in her book: Craft Cocktail Party) then just muddle a few ripe raspberries in the tin before adding your ingredients to dry shake, then substitute simple syrup for raspberry syrup."),
                                          Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold. Do not over dilute"),
                                          Instruction(step: 3, method: "Immediately after shaking (with vigor), pop the tin and double strain very carefully into a stemmed glass."),
                                          Instruction(step: 4, method: "Garnish with a raspberry.")])


var cloverClubTags = Tags(profiles: [.citrusy, .fruity, .tart],
                          textures: [.light, .silky],
                          styles: [.sour, .shaken])
                   
