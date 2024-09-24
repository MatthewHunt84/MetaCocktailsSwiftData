//
//  VieuxCarre.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/21/24.
//

import Foundation

var vieuxCarre = Cocktail(cocktailName: "Vieux Carré",
                          glasswareType: .doubleOld,
                          garnish: [.lemonPeel],
                          ice: .bigRock,
                          author: Author(person: AuthorNames.walterBergeron.rawValue,
                                         place: AuthorPlaces.hotelMonteleone.rawValue,
                                         year: "1934"),
                          spec: vieuxCarreSpec,
                          tags: vieuxCarreTags,
                          collection: .originals)

var vieuxCarreSpec     =  [OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                           OldCocktailIngredient(.bitters(.peychauds), value: 2, unit: .dashes),
                           OldCocktailIngredient(.liqueurs(.benedictine), value: 1, unit: .teaspoon),
                           OldCocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1),
                           OldCocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 1),
                           OldCocktailIngredient(.brandies(.cognacVSOP), value: 1)]

var vieuxCarreTags     = Tags(flavors: [.lemon],
                              profiles: [.spiritForward, .rich, .punchy, .bittersweet],
                              styles: [.manhattan, .stirred])

