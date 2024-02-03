//
//  HappyAccidents.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/3/24.
//

import Foundation

var happyAccidents = Cocktail(cocktailName: "Happy Accidents",
                              imageAsset: nil,
                              glasswareType: .collins,
                              garnish: [.cucumberSliceLong],
                              ice: .columnIce,
                              author: Author(person: "Justin Jenkins", place: AuthorPlaces.williamsAndGraham.rawValue, year: "Spring, 2022"),
                              spec: happyAccidentsSpec,
                              tags: happyAccidentsTags)

let happyAccidentsSpec: [CocktailIngredient] = [CocktailIngredient(.soda(.sodaWater), value: 2),
                                                CocktailIngredient(.fruit(.cucumberSlices), value: 2, unit: .muddled),
                                                CocktailIngredient(.juices(.lemon), value: 1),
                                                CocktailIngredient(.otherAlcohol(.absinthe), value: 0.23),
                                                CocktailIngredient(.amari(.amaroMontenegro), value: 1),
                                                CocktailIngredient(.liqueurs(.italicus), value: 1, unit: .whole)]


let happyAccidentsTags = Tags(profiles: [.refreshing, .light, .bright, .restorative],
                              styles: [.shaken, .fizz])

