////
////  CloverClub.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/24/23.
////

import SwiftUI

var cloverClub = Cocktail(cocktailName: "Clover Club(Reiner's)",
                          glasswareType: .stemmedGlassware,
                          garnish: [.raspberry],
                          author: Author(person: "Julie Reiner", place: "Clover Club", year: "2014"),
                          spec: cloverClubSpec,
                          buildOrder: cloverClubBuild,
                          tags: cloverClubTags,
                          variation: .cloverClub,
                          titleCocktail: true)

var cloverClubSpec  = [CocktailIngredient(.juices(.lemon), value: 0.5),
                       CocktailIngredient(.syrups(.raspberrySyrup), value: 0.5, prep: PrepBible.raspberrySyrup),
                       CocktailIngredient(.otherNonAlc(.eggWhites), value: 0.5),
                       CocktailIngredient(.fortifiedWines(.dolinDry), value: 0.5),
                       CocktailIngredient(.gins(.plymouth), value: 1.5)]

var cloverClubBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients into a tin a dry shake to emulsify. If you don't feel like making a raspberry syrup (we recommend Julie Reiner's version in her book: Craft Cocktail Party) then just muddle a few ripe raspberries in the tin before adding your ingredients to dry shake, then substitute simple syrup for raspberry syrup."),
                                           Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold. Do not over dilute"),
                                           Instruction(step: 3, method: "Immediately after shaking (with vigor), pop the tin and double strain very carefully into a stemmed glass."),
                                           Instruction(step: 4, method: "Garnish with a raspberry."),
                                           Instruction(step: 4, method: "The original Clover Club was a gentleman's club in Philadelphia from 1882-1920s.")])


var cloverClubTags = Tags(profiles: [.citrusy, .fruity, .tart, .light, .silky],
                          styles: [.sour, .shaken])

