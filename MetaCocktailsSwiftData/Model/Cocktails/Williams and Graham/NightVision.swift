//
//  NightVision.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var nightVision  =  Cocktail(cocktailName: "Night Vision",
                             glasswareType: .stemmedGlassware,
                             garnish: [.peaTendril],
                             ice: nil,
                             author: Author(person:AuthorNames.valarieAlvarado.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue, year: "2018"),
                             spec: nightVisionSpec,
                             buildOrder: nil,
                             tags: nightVisionTags,
                             collection: .williamsAndGraham)

var nightVisionSpec = [OldCocktailIngredient(.juices(.lemon), value: 0.25),
                       OldCocktailIngredient(.syrups(.orgeat), value: 0.5, prep: PrepBible.orgeat),
                       OldCocktailIngredient(.juices(.carrotJuice), value: 1),
                       OldCocktailIngredient(.amari(.becherovka), value: 0.5),
                       OldCocktailIngredient(.rums(.avuaPrata), value: 1.5)]

var nightVisionTags = Tags(profiles: [.savory, .refreshing, .funky],
                           styles: [.sour, .shaken])
