//
//  ModernCocktail.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var modernCocktail = Cocktail(cocktailName: "Modern Cocktail",
                              glasswareType: .stemmedGlassware,
                              garnish: [.maraschinoCherry],
                              ice: nil,
                              author:Author(person: AuthorNames.charlesMahoney.rawValue,
                                            place: AuthorPlaces.hoffmanBartendersGuide.rawValue,
                                            year: "1905"),
                              spec: modernCocktailSpec,
                              tags: modernCocktailTags,
                              variation: .modernCocktail,
                              collection: .originals,
                              titleCocktail: true)

var modernCocktailSpec = [OldCocktailIngredient(.juices(.lemon), value: 3, unit: .dashes),
                          OldCocktailIngredient(.bitters(.orangeBitters), value: 1, unit: .dashes),
                          OldCocktailIngredient(.otherAlcohol(.absinthe), value:1, unit: .dashes),
                          OldCocktailIngredient(.syrups(.simple), value: 4, unit: .dashes),
                          OldCocktailIngredient(.whiskies(.scotchAny), value: 1),
                          OldCocktailIngredient(.liqueurs(.plymouthSloeGin), value: 1)]

var modernCocktailTags = Tags(profiles: [.citrusy, .fruity, .light, .complex, .refreshing],
                              styles: [.sour, .shaken])
