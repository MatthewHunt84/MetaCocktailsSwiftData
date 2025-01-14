//
//  KTCollins.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var kTCollins  = Cocktail(cocktailName: "KT Collins",
                          glasswareType: .collins,
                          garnish: nil,
                          ice: .columnIce,
                          author: Author(person: AuthorNames.sashaPetraske.rawValue,
                                         place: AuthorPlaces.johnDoryOysterBar.rawValue,
                                         year: "Early 2000s"),
                          spec: kTCollinsSpec,
                          buildOrder: ktCollinsBuild,
                          tags: kTCollinsTags,
                          variation: nil,
                          collection: .milkAndHoney)

var kTCollinsSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                      OldCocktailIngredient(.otherNonAlc(.celeryStrip), value: 2, unit: .muddled),
                      OldCocktailIngredient(.seasoning(.salt), value: 1, unit: .pinch),
                      OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                      OldCocktailIngredient(.gins(.ginAny), value: 2),
                      OldCocktailIngredient(.soda(.sodaWater) , value: 1.5)]



var kTCollinsTags   = Tags(profiles: [.citrusy, .effervescent, .light, .vegetal],
                           styles: [.collins, .shaken])

