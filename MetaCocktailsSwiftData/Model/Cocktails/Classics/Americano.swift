//
//  Americano.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var americano  = Cocktail(cocktailName: "Americano",
                          glasswareType: .collins,
                          garnish: [.orangeOrLemon, .halfOrangeWheel],
                          ice: .koldDraft, 
                          author: Author(person: "Emile Lefeuvre", place: "Paris", year: "1889"),
                          spec: americanoSpec,
                          tags: americanoTags,
                          variation: .americano,
                          collection: .originals,
                          titleCocktail: true)

var americanoSpec  = [OldCocktailIngredient(.soda(.sodaWater), value: 2),
                      OldCocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1.5),
                      OldCocktailIngredient(.amari(.campari), value: 1.5)]



var americanoTags   = Tags(profiles: [.bittersweet, .refreshing, .light, .effervescent],
                           styles: [.fizz, .built])

