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
                          author: Author(person: "Julie Reiner", place: "Clover Club", year: "2014"),
                          spec: cloverClubSpec,
                          buildOrder: cloverClubBuild,
                          notes: cloverClubNotes,
                          tags: cloverClubTags,
                          variation: .cloverClub,
                          titleCocktail: true)

var cloverClubSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.5),
                       OldCocktailIngredient(.syrups(.raspberrySyrup), value: 0.5, prep: PrepBible.raspberrySyrup),
                       OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 0.5),
                       OldCocktailIngredient(.fortifiedWines(.dolinDry), value: 0.5),
                       OldCocktailIngredient(.gins(.plymouth), value: 1.5)]

var cloverClubBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients into a tin a dry shake to emulsify."),
                                           Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold. Do not over dilute"),
                                           Instruction(step: 3, method: "Immediately after shaking (with vigor), pop the tin and double strain very carefully into a stemmed glass."),
                                           Instruction(step: 4, method: "Garnish with a raspberry.")])


var cloverClubTags = Tags(profiles: [.citrusy, .fruity, .tart, .light, .silky],
                          styles: [.sour, .shaken])
