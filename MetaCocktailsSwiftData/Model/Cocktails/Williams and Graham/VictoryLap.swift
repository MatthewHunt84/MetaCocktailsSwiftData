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
                          author: Author(person: AuthorNames.johnShramm.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue, year: "Fall, 2022"),
                          spec: victoryLapSpec,
                          tags: victoryLapTags,
                          collection: .williamsAndGraham)

let victoryLapSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.juices(.lime), value: 0.25),
                                               OldCocktailIngredient(.otherAlcohol(.notSpicyJalapeñoTincture), value: 1, unit: .dashes),
                                               OldCocktailIngredient(.syrups(.agaveSyrup), value: 0.25, prep: PrepBible.agaveSyrup),
                                               OldCocktailIngredient(.syrups(.clementineShrub), value: 0.5, prep: PrepBible.clementineShrub),
                                               OldCocktailIngredient(.fruit(.guavaPure), value: 0.75),
                                               OldCocktailIngredient(.liqueurs(.anchoVerde), value: 0.5),
                                               OldCocktailIngredient(.agaves(.tequilaSieteLeguasBlanco), value: 1.5)]


let victoryLapTags = Tags(profiles: [.refreshing, .complex, .fruity],
                          styles: [.sour, .shaken, .tiki])

