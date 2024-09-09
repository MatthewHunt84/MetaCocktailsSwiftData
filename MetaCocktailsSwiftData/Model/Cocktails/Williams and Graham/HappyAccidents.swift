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
                              tags: happyAccidentsTags,
                              collection: .williamsAndGraham)

let happyAccidentsSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.soda(.sodaWater), value: 2),
                                                OldCocktailIngredient(.fruit(.cucumberSlices), value: 2, unit: .muddled),
                                                OldCocktailIngredient(.juices(.lemon), value: 1),
                                                OldCocktailIngredient(.otherAlcohol(.absinthe), value: 0.23),
                                                OldCocktailIngredient(.amari(.amaroMontenegro), value: 1),
                                                OldCocktailIngredient(.liqueurs(.italicus), value: 1, unit: .whole)]


let happyAccidentsTags = Tags(profiles: [.refreshing, .light, .restorative, .citrusy],
                              styles: [.shaken, .fizz])

