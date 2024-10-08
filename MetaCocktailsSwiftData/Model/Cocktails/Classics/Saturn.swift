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
                      notes: saturnNotes,
                      tags: saturnTags,
                      variation: .saturn,
                      collection: .originals,
                      titleCocktail: true)

var saturnSpec  =  [OldCocktailIngredient(.juices(.lemon), value: 0.5),
                    OldCocktailIngredient(.syrups(.passionfruitSyrup), value: 0.5, prep: PrepBible.passionfruitSyrupPrep),
                    OldCocktailIngredient(.syrups(.orgeat), value: 0.25, prep: PrepBible.orgeat),
                    OldCocktailIngredient(.liqueurs(.velvetFalernum), value: 0.25),
                    OldCocktailIngredient(.gins(.ginAny), value: 1.5)]

var saturnTags = Tags( profiles: [.citrusy, .fruity, .tropical, .sweet, .refreshing, .floral, .light],
                       styles: [.tiki, .shaken, .sour, .blended])

var saturnBuildOrder = Build(instructions: [Instruction(step: 1, method: "Skewer the lemon peel around the cherry to make it look like the rings of Saturn. The original cocktail was blended. So, blend if you must.")])
