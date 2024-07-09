//
//  FancyFree.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var fancyFree = Cocktail(cocktailName: "Fancy Free",
                         glasswareType: .doubleOld,
                         garnish: [.orangePeel],
                         ice: .bigRock,
                         author: Author(person: AuthorNames.crosbyGaige.rawValue, 
                                        place: AuthorPlaces.crosbyGaigeCocktailGuide.rawValue,
                                        year: "1940"),
                         spec: fancyFreeSpec,
                         tags: fancyFreeTags,
                         variation: .fancyFree,
                         collection: .originals,
                         titleCocktail: true)

var fancyFreeSpec     =  [OldCocktailIngredient(.bitters(.orangeBitters), value: 1, unit: .dashes),
                          OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                          OldCocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.5),
                          OldCocktailIngredient(.whiskies(.straightRyeOrBourbon), value: 2)]

var fancyFreeTags     = Tags(profiles: [.spiritForward, .fruity, .bittersweet],
                             styles: [.oldFashioned, .stirred])

