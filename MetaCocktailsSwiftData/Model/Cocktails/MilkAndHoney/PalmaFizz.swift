//
//  PalmaFizz.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var palmaFizz  = Cocktail(cocktailName: "Palma Fizz",
                          glasswareType: .collins,
                          garnish: nil,
                          ice: .koldDraft,
                          author: Author(person: AuthorNames.sashaPetraske.rawValue,
                                         place: AuthorPlaces.milkAndHoney.rawValue,
                                         year: "Early 2000s"),
                          spec: palmaFizzSpec,
                          buildOrder: palmaFizzBuild,
                          tags: palmaFizzTags,
                          variation: nil,
                          collection: .milkAndHoney)

var palmaFizzSpec  = [OldCocktailIngredient(.juices(.lime), value: 0.5),
                      OldCocktailIngredient(.otherNonAlc(.roseWater), value: 3, unit: .drops),
                      OldCocktailIngredient(.vodkas(.vodkaAny), value: 2),
                      OldCocktailIngredient(.soda(.gingerBeer) , value: 5, prep: PrepBible.gingerBeer)]



var palmaFizzTags   = Tags(profiles: [.citrusy, .effervescent, .light],
                           styles: [.collins, .shaken])

