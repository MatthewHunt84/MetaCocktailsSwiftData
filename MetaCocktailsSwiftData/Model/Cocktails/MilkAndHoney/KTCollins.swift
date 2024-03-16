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
                          buildOrder: kTCollinsBuild,
                          tags: kTCollinsTags,
                          variation: nil,
                          collection: .milkAndHoney)

var kTCollinsSpec  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                      CocktailIngredient(.otherNonAlc(.celeryStrip), value: 2, unit: .muddled),
                      CocktailIngredient(.seasoning(.salt), value: 1, unit: .pinch),
                      CocktailIngredient(.syrups(.simple), value: 0.75),
                      CocktailIngredient(.gins(.ginAny), value: 2),
                      CocktailIngredient(.soda(.sodaWater) , value: 1.5)]

var kTCollinsBuild  = Build(instructions: [Instruction(step: 1, method: "Muddle the celery in a cocktail shaker."),
                                           Instruction(step: 2, method: "Fill the shaker with ice, add the lemon juice, simple syrup, salt, and gin, and shake vigorously until the drink is sufficiently chilled."),
                                           Instruction(step: 3, method: "Strain into a Collins glass filled with ice. Top off with club soda.")])

var kTCollinsTags   = Tags(profiles: [.citrusy, .effervescent, .light, .vegetal],
                           styles: [.collins, .shaken])

