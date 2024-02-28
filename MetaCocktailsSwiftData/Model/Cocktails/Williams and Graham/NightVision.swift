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
                             tags: nightVisionTags)

var nightVisionSpec = [CocktailIngredient(.juices(.lemon), value: 0.25),
                       CocktailIngredient(.syrups(.orgeat), value: 0.5, prep: PrepBibleViewModel().orgeat),
                       CocktailIngredient(.juices(.carrotJuice), value: 1),
                       CocktailIngredient(.amari(.becherovka), value: 0.5),
                       CocktailIngredient(.rums(.avuaPrata), value: 1.5)]

var nightVisionTags = Tags(profiles: [.savory, .refreshing, .funky],
                           styles: [.sour, .shaken])
