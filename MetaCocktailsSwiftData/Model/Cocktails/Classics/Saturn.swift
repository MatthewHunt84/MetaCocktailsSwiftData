////
////  Saturn.swift
////  MetaCocktailsSwiftData
////
////  Created by James Menkal on 11/26/23.
////

import SwiftUI

var saturn = Cocktail(cocktailName: "Saturn",
                      glasswareType: .doubleOld,
                      garnish: [.lemonPeel, .maraschinoCherry],
                      ice: .pebbleIce,
                      author:Author(person: "Joseph “Po Po” Galsini"),
                      spec: saturnSpec,
                      buildOrder: saturnBuildOrder,
                      tags: saturnTags)

var saturnSpec  =  [CocktailIngredient(.juices(.lemon), value: 0.75),
                    CocktailIngredient(.syrups(.passionfruitSyrup), value: 0.75),
                    CocktailIngredient(.syrups(.orgeat), value: 0.25),
                    CocktailIngredient(.liqueurs(.velvetFalernum), value: 0.25),
                    CocktailIngredient(.gins(.ginAny), value: 2)]

var saturnTags = Tags( profiles: [.citrusy, .fruity, .tropical, .sweet, .refreshing, .floral, .light],
                       styles: [.tiki, .shaken, .sour])

var saturnBuildOrder = Build(instructions: [Instruction(step: 1, method: "Just a note about the recipe: This is not the origional, all the componants are the same but this is the spec that we've found works the best. Feel free to make it your own or follow the exact recipe in the book 'Beachbum Berry Remix'.")])
