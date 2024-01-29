//
//  JeredLetosPrettyFace.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation

var jaredLetosPrettyFace = Cocktail(cocktailName: "Jared Leto's Pretty Face",
                                    imageAsset: nil,
                                    glasswareType: .collins,
                                    garnish: [.raspberry, .lemonWheel], 
                                    ice: .pebbleIce,
                                    author: Author(place: AuthorPlaces.williamsAndGraham.rawValue),
                                    spec: jaredLetosPrettyFaceSpec,
                                    tags: jaredLetosPrettyFaceTags)

let jaredLetosPrettyFaceSpec: [CocktailIngredient] = [CocktailIngredient(.fruit(.raspberries), value: 2, unit: .muddled),
                                                      CocktailIngredient(.syrups(.passionfruitSyrup), value: 0.75),
                                                      CocktailIngredient(.syrups(.gingerSyrup), value: 0.75),
                                                      CocktailIngredient(.juices(.lemon), value: 0.75),
                                                      CocktailIngredient(.agaves(.tequilaOchoBlanco), value: 2)]


let jaredLetosPrettyFaceTags = Tags(profiles: [.light,.sharp, .fruity, .refreshing],
                                    styles: [.sour, .shaken])
