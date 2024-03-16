//
//  DaiquiriNo4.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/11/24.
//

import Foundation

let daiquiriNo4MnH = Cocktail(cocktailName: "Daiquiri No. 4",
                              glasswareType: .coupe,
                              garnish: [.maraschinoCherry],
                              author: Author(place: AuthorPlaces.milkAndHoney.rawValue, year: "Early 2000s"),
                              spec: daiquiriNo4MnHSpec,
                              tags: daiquiriNo4MnHTags,
                              variation: .daiquiri,
                              collection: .milkAndHoney)

var daiquiriNo4MnHSpec: [CocktailIngredient] = [CocktailIngredient(.rums(.rumWhite), value: 2.0),
                                                CocktailIngredient(.juices(.lime), value: 0.75),
                                                CocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.75)]

var daiquiriNo4MnHTags = Tags(profiles: [.citrusy, .refreshing, .light, .tart, .fruity],
                              styles: [.sour, .shaken])

