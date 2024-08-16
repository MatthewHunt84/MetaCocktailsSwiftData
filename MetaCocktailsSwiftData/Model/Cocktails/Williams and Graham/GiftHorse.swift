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

var giftHorseSpec  = [OldCocktailIngredient(.syrups(.honeySyrup), value: 0.25, prep: PrepBible.honeySyrup),
                      OldCocktailIngredient(.liqueurs(.drambuie), value: 1, unit: .teaspoon),
                      OldCocktailIngredient(.fortifiedWines(.byrrh), value: 0.5),
                      OldCocktailIngredient(.amari(.DellErborista), value: 0.75),
                      OldCocktailIngredient(.agaves(.tequilaSieteLeguasRepo), value: 1.5)]

var giftHorseTags = Tags(flavors: [.orange],
                         profiles: [.rich, .bittersweet],
                         styles: [.martini, .stirred])
