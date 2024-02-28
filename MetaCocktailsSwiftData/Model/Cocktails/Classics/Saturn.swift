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
                      author: Author(person: "Joseph “Po Po” Galsini", year: "1967"),
                      spec: saturnSpec,
                      buildOrder: saturnBuildOrder,
                      tags: saturnTags,
                      variation: .saturn)

var saturnSpec  =  [CocktailIngredient(.juices(.lemon), value: 0.5),
                    CocktailIngredient(.syrups(.passionfruitSyrup), value: 0.5),
                    CocktailIngredient(.syrups(.orgeat), value: 0.25, prep: PrepBibleViewModel().orgeat),
                    CocktailIngredient(.liqueurs(.velvetFalernum), value: 0.25),
                    CocktailIngredient(.gins(.ginAny), value: 1.5)]

var saturnTags = Tags( profiles: [.citrusy, .fruity, .tropical, .sweet, .refreshing, .floral, .light],
                       styles: [.tiki, .shaken, .sour, .blended])

var saturnBuildOrder = Build(instructions: [Instruction(step: 1, method: "Skewer the lemon peel around the cherry to make it look like the rings of Saturn. The original cocktail was blended. So, blend if you must."),
                                            Instruction(step: 2, method: "FUN FACT: California bartender  J. “Popo” Galsini introduced the Saturn to the world in 1967 when he won the International Bartender’s Association World Championship with it. Originally he titled his gin creation the X-15 after an American rocket plane, but shortly after doing so one of those planes crashed, killing its pilot. Reportedly, Galsini changed the name of the drink to the Saturn for the competition. 😬")])

