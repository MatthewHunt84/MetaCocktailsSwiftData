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
                         tags: fancyFreeTags)

var fancyFreeSpec     =  [CocktailIngredient(.bitters(.orangeBitters), value: 1, unit: .dash),
                          CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dash),
                          CocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.5),
                          CocktailIngredient(.whiskies(.straightRyeOrBourbon), value: 2)]

var fancyFreeTags     = Tags(profiles: [.spiritForward, .fruity, .bittersweet],
                             styles: [.oldFashioned, .stirred])

