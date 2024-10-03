//
//  HemingwayDaiquiri.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/30/24.
//

import Foundation

let hemingwayDaiquiri = Cocktail(cocktailName: "Hemingway Daiquiri",
                                 glasswareType: .coupe,
                                 garnish: [.limeWheel],
                                 author:Author(person: AuthorNames.constante.rawValue, place: AuthorPlaces.laFloridita.rawValue, year: "1938"),
                                 spec: hemingwayDaiquiriSpec,
                                 notes: hemingwayNote,
                                 tags: hemingwayDaiquiriTags,
                                 variation: .hemingwayDaiquiri,
                                 collection: .originals, 
                                 titleCocktail: true)

var hemingwayDaiquiriSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.juices(.lime), value: 0.5),
                                                   OldCocktailIngredient(.juices(.grapefruit), value: 0.25),
                                                   OldCocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.25),
                                                   OldCocktailIngredient(.rums(.rumWhite), value: 2.0)]



var hemingwayDaiquiriTags = Tags(profiles: [.citrusy, .tart, .punchy],
                                 styles: [.daisy, .shaken, .sour, .blended])
