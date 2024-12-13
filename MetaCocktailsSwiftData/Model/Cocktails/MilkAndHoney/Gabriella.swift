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


