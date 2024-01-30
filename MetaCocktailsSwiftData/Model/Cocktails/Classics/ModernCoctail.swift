//
//  ModernCoctail.swift
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
                              tags: modernCocktailTags)

var modernCocktailSpec = [CocktailIngredient(.juices(.lemon), value: 3, unit: .dashes),
                          CocktailIngredient(.bitters(.orangeBitters), value: 1, unit: .dash),
                          CocktailIngredient(.otherAlcohol(.absinthe), value:1, unit: .dash),
                          CocktailIngredient(.syrups(.simple), value: 4, unit: .dashes),
                          CocktailIngredient(.whiskies(.scotchAny), value: 1),
                          CocktailIngredient(.liqueurs(.plymouthSloeGin), value: 1)]

var modernCocktailTags = Tags(profiles: [.citrusy, .fruity, .light, .complex, .refreshing],
                              styles: [.sour, .shaken])
