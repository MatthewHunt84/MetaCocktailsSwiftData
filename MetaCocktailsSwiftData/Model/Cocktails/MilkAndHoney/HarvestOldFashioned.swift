//
//  HarvestOldFashioned.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/12/24.
//

import Foundation

var harvestOldFashioned = Cocktail(cocktailName: "Harvest Old Fashioned",
                                   glasswareType: .doubleOld,
                                   garnish: [.lemonPeel, .orangePeel],
                                   ice: .bigRock,
                                   author:Author(person: AuthorNames.sashaPetraske.rawValue,
                                                 place: AuthorPlaces.milkAndHoney.rawValue ,
                                                 year: "Early 2000s"),
                                   spec: harvestOldFashionedSpec,
                                   buildOrder: harvestOldFashionedBuild,
                                   tags: harvestOldFashionedTags,
                                   variation: nil,
                                   collection: .milkAndHoney)

var harvestOldFashionedSpec     =  [OldCocktailIngredient(.otherNonAlc(.sugarCube), value: 1, unit: .muddled),
                                    OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                                    OldCocktailIngredient(.bitters(.peychauds), value: 1, unit: .dashes),
                                    OldCocktailIngredient(.brandies(.lairdsApplejack), value: 1),
                                    OldCocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 1)]

var harvestOldFashionedTags     = Tags(flavors: [.orange, .lemon], profiles: [.spiritForward, .bittersweet],
                                       styles: [.oldFashioned, .stirred])


