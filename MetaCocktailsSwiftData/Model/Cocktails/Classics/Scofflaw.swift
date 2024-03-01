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
                        collection: .originals)

var scofflawSpec  = [CocktailIngredient(.juices(.lemon), value: 1, unit: .dash),
                     CocktailIngredient(.syrups(.grenadine), value: 1, unit: .dash),
                     CocktailIngredient(.fortifiedWines(.dryVermouthAny), value: 1),
                     CocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 1.5)]

var scofflawTags = Tags(profiles: [.fruity, .dry, .punchy],
                        styles: [.sour, .shaken])
