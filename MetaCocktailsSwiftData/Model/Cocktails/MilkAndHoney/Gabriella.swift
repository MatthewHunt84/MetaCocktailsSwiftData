//
//  Gabriella.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/11/24.
//

import Foundation


var gabriella = Cocktail(cocktailName: "Gabriella",
                         glasswareType: .doubleOld,
                         garnish: [.strawberryHalf],
                         ice: .pebbleIce,
                         author:Author(person: AuthorNames.sashaPetraske.rawValue ,place: AuthorPlaces.milkAndHoney.rawValue , year: "Early 2000s"),
                         spec: gabriellaSpec,
                         buildOrder: gabriellaBuild,
                         tags: gabriellaTags,
                         collection: .milkAndHoney)

var gabriellaSpec     =  [OldCocktailIngredient(.fruit(.strawberryHalf), value: 1, unit: .muddled),
                          OldCocktailIngredient(.juices(.lemon), value: 0.73),
                          OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                          OldCocktailIngredient(.seasoning(.salt), value: 1, unit: .pinch),
                          OldCocktailIngredient(.brandies(.pisco), value: 2)]

var gabriellaTags     = Tags(profiles: [.light, .refreshing, .citrusy, .tart],
                             styles: [.sour, .shaken])

var gabriellaBuild = Build(instructions: [Instruction(step: 1, method: "Hull one half of the strawberry. Combine it with the lemon juice in a cocktail shaker and muddle gently."),
                                          Instruction(step: 2, method: "Add the simple syrup, pisco, and one large ice cube and shake vigorously until the drink is sufficiently chilled. "),
                                          Instruction(step: 3, method: "Strain into a rocks glass and add crushed ice until a 'high and dry' mountain is formed."),
                                          Instruction(step: 4, method: "Garnish with the remaining strawberry half and the pinch of salt.")])
