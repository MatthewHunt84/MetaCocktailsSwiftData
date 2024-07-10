//
//  Scofflaw.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var scofflaw = Cocktail(cocktailName: "Scofflaw",
                        glasswareType: .stemmedGlassware,
                        garnish: [.lemonPeel],
                        ice: nil,
                        author: Author(person: "Maxim's Bar", place: "Paris", year: "1924"),
                        spec: scofflawSpec,
                        buildOrder: nil,
                        tags: scofflawTags,
                        variation: .scofflaw,
                        collection: .originals,
                        titleCocktail: true)

var scofflawSpec  = [OldCocktailIngredient(.juices(.lemon), value: 1, unit: .dashes),
                     OldCocktailIngredient(.syrups(.grenadine), value: 1, unit: .dashes),
                     OldCocktailIngredient(.fortifiedWines(.dryVermouthAny), value: 1),
                     OldCocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 1.5)]

var scofflawTags = Tags(profiles: [.fruity, .dry, .punchy],
                        styles: [.sour, .shaken])
