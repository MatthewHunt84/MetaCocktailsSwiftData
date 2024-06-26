//
//  Greenpoint.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/27/24.
//

import Foundation

var greenpoint = Cocktail(cocktailName: "Greenpoint",
                          glasswareType: .stemmedGlassware,
                          garnish: [.lemonPeel],
                          author:Author(person: "Michael McIlroy",
                                        place: AuthorPlaces.milkAndHoney.rawValue,
                                        year: "2006"),
                          spec: greenpointSpec,
                          tags: greenpointTags,
                          variation: .greenpoint,
                          titleCocktail: true)

var greenpointSpec     =  [CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                           CocktailIngredient(.bitters(.orangeBitters), value: 1, unit: .dashes),
                           CocktailIngredient(.liqueurs(.yellowChartreuse), value: 0.5),
                           CocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 0.5),
                           CocktailIngredient(.whiskies(.straightRye), value: 2)]

var greenpointTags     = Tags(profiles: [.spiritForward, .rich, .complex, .bittersweet],
                              styles: [.manhattan, .stirred])

