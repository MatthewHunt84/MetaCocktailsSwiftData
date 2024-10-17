//
//  JeredLetosPrettyFace.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation

var jaredLetosPrettyFace = Cocktail(cocktailName: "Jared Leto's Pretty Face",
                                    glasswareType: .collins,
                                    garnish: [.raspberry, .lemonWheel], 
                                    ice: .pebbleIce,
                                    author: Author(person: AuthorNames.nicoleLaurita.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue),
                                    spec: jaredLetosPrettyFaceSpec,
                                    tags: jaredLetosPrettyFaceTags,
                                    collection: .williamsAndGraham)

let jaredLetosPrettyFaceSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.fruit(.raspberries), value: 2, unit: .muddled),
                                                         OldCocktailIngredient(.syrups(.passionfruitSyrup), value: 0.75, prep: PrepBible.passionfruitSyrupPrep),
                                                         OldCocktailIngredient(.syrups(.gingerSyrup), value: 0.75, prep: PrepBible.gingerSyrup),
                                                         OldCocktailIngredient(.juices(.lemon), value: 0.75),
                                                         OldCocktailIngredient(.agaves(.tequilaOchoBlanco), value: 2)]


let jaredLetosPrettyFaceTags = Tags(profiles: [.light, .fruity, .refreshing],
                                    styles: [.sour, .shaken])
