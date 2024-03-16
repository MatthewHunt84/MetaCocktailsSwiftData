//
//  RossCollins.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var rossCollins  = Cocktail(cocktailName: "Ross Collins",
                            glasswareType: .collins,
                            garnish: [.maraschinoCherry, .halfOrangeWheel],
                            ice: .koldDraft,
                            author: Author(person: AuthorNames.samRoss.rawValue,
                                           place: AuthorPlaces.milkAndHoney.rawValue,
                                           year: "Early 2000s"),
                            spec: rossCollinsSpec,
                            buildOrder: rossCollinsBuild,
                            tags: rossCollinsTags,
                            variation: nil,
                            collection: .milkAndHoney)

var rossCollinsSpec  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                        CocktailIngredient(.syrups(.simple), value: 0.75),
                        CocktailIngredient(.fruit(.orangeMoons), value: 2, unit: .muddled),
                        CocktailIngredient(.bitters(.angosturaBitters), value: 3, unit: .dashes),
                        CocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 2),
                        CocktailIngredient(.soda(.sodaWater) , value: 1.5)]

var rossCollinsBuild  = Build(instructions: [Instruction(step: 1, method: "Combine the whiskey, lemon juice, simple syrup, 2 orange slices, and bitters in a cocktail shaker, fill with ice, and shake vigorously until the drink is sufficiently chilled."),
                                             Instruction(step: 2, method: "Strain into a Collins glass, top off with club soda."),
                                             Instruction(step: 3, method: "Garnish with an orange slice and a brandied cherry.")])

var rossCollinsTags   = Tags(profiles: [.citrusy, .effervescent, .light, .refreshing],
                             styles: [.collins, .shaken])

