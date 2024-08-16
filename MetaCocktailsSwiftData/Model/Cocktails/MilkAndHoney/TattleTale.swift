//
//  TattleTale.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/29/24.
//

import Foundation

var tattletale = Cocktail(cocktailName: "Tattletale",
                          glasswareType: .doubleOld,
                          garnish: [.lemonPeel, .orangePeel],
                          ice: .bigRock,
                          author:Author(person: AuthorNames.samRoss.rawValue ,  place: AuthorPlaces.milkAndHoney.rawValue , year: "Early 2000s"),
                          spec: tattletaleSpec,
                          buildOrder: nil,
                          tags: tattletaleTags,
                          collection: .milkAndHoney)

var tattletaleSpec     =  [OldCocktailIngredient(.bitters(.angosturaBitters), value: 3, unit: .dashes),
                           OldCocktailIngredient(.syrups(.honey), value: 1, unit: .barSpoon),
                           OldCocktailIngredient(.whiskies(.scotchHighland), value: 1.25),
                           OldCocktailIngredient(.whiskies(.scotchIsla), value: 0.75)]

var tattletaleTags     = Tags(flavors: [.orange, .lemon],
                              profiles: [.spiritForward, .bittersweet, .smokey],
                              styles: [.oldFashioned, .stirred])
