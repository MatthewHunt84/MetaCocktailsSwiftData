//
//  VictoryLap.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/3/24.
//

import Foundation

var victoryLap = Cocktail(cocktailName: "Victory Lap",
                          imageAsset: nil,
                          glasswareType: .tikiMug,
                          garnish: [.dehydratedGrapefruitSlice],
                          ice: .pebbleIce,
                          author: Author(person: "John Shramm", place: AuthorPlaces.williamsAndGraham.rawValue, year: "Fall, 2022"),
                          spec: victoryLapSpec,
                          tags: victoryLapTags)

let victoryLapSpec: [CocktailIngredient] = [CocktailIngredient(.juices(.lime), value: 0.25),
                                            CocktailIngredient(.otherAlcohol(.notSpicyJalapeñoTincture), value: 1, unit: .dash),
                                            CocktailIngredient(.syrups(.agaveSyrup), value: 0.25, prep: PrepBibleViewModel().agaveSyrup),
                                            CocktailIngredient(.syrups(.clementineShrub), value: 0.5),
                                            CocktailIngredient(.fruit(.guavaPure), value: 0.75),
                                            CocktailIngredient(.liqueurs(.anchoVerde), value: 0.5),
                                            CocktailIngredient(.agaves(.tequilaSieteLeguasBlanco), value: 1.5)]


let victoryLapTags = Tags(profiles: [.refreshing, .complex, .fruity],
                          styles: [.sour, .shaken, .tiki])

