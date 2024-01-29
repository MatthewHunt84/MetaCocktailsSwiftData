//
//  VieuxCarre.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/21/24.
//

import Foundation

var vieuxCarre = Cocktail(cocktailName: "Vieux Carre",
                          glasswareType: .doubleOld,
                          garnish: [.lemonPeel],
                          ice: .bigRock,
                          author: Author(person: AuthorNames.walterBergeron.rawValue,
                                         place: AuthorPlaces.hotelMonteleone.rawValue,
                                         year: "1934"),
                          spec: vieuxCarreSpec,
                          tags: vieuxCarreTags)

var vieuxCarreSpec     =  [CocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                           CocktailIngredient(.bitters(.peychauds), value: 2, unit: .dashes),
                           CocktailIngredient(.liqueurs(.benedictine), value: 1, unit: .teaspoon),
                           CocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1),
                           CocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 2),
                           CocktailIngredient(.brandies(.cognacVSOP), value: 2)]

var vieuxCarreTags     = Tags(profiles: [.spiritForward, .rich, .punchy, .bittersweet],
                              styles: [.manhattan, .stirred])

