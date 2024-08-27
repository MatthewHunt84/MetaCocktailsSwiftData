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

var hemingwayNote = "The original cocktail stemmed from the Daiquiri No. 3 at La Floridita, which actually was one of the first blended Daiquiris to ever exist as Constantino 'Constante' Ribalaigua was utilizing the latest technology that existed at the time, the blender. Hemingway loved the cocktail but asked for it with no sugar and double the rum making it an insanely tart and punchy cocktail. The cocktail is unbalanced but I think it's important to understand where this cocktail came from and why it exists."
