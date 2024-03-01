//
//  GiftHorse.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation


var giftHorse = Cocktail(cocktailName: "Gift Horse",
                            glasswareType: .stemmedGlassware,
                            garnish: [.orangePeel],
                            ice: nil,
                            author: Author(person: AuthorPlaces.williamsAndGraham.rawValue),
                            spec: giftHorseSpec,
                            tags: giftHorseTags,
                         collection: .williamsAndGraham)

var giftHorseSpec  = [CocktailIngredient(.syrups(.honeySyrup), value: 0.25, prep: PrepBible.honeySyrup),
                      CocktailIngredient(.liqueurs(.drambuie), value: 1, unit: .teaspoon),
                      CocktailIngredient(.fortifiedWines(.byrrh), value: 0.5),
                      CocktailIngredient(.amari(.DellErborista), value: 0.75),
                      CocktailIngredient(.agaves(.tequilaSieteLeguasRepo), value: 1.5)]

var giftHorseTags = Tags(profiles: [.rich, .bittersweet],
                         styles: [.martini, .stirred])
