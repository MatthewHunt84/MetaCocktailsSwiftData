//
//  HankyPanky.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/27/24.
//

import Foundation

var hankyPanky = Cocktail(cocktailName: "Hanky Panky",
                          glasswareType: .stemmedGlassware,
                          garnish: [.orangePeel],
                          author:Author(person: "Ada 'Coley' Colman",
                                        place: AuthorPlaces.savoy.rawValue,
                                        year: "1921"),
                          spec: hankyPankySpec,
                          tags: hankyPankyTags,
                          variation: .hankyPanky,
                          collection: .originals,
                          titleCocktail: true)

var hankyPankySpec     =  [OldCocktailIngredient(.amari(.fernetBranca), value: 2, unit: .dashes),
                           OldCocktailIngredient(.gins(.ginLondonDry), value: 1.5),
                           OldCocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1.5)]

var hankyPankyTags     = Tags(flavors: [.orange],
                              profiles: [.spiritForward, .complex, .bittersweet],
                              styles: [.martini, .stirred])

