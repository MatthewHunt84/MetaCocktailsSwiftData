//
//  DaiquiriMnH.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/4/24.
//

import Foundation

let daiquiriMnH = Cocktail(cocktailName: "Daiquiri(Milk and Honey version)",
                           glasswareType: .coupe,
                           garnish: nil,
                           spec: daiquiriMnHSpec,
                           tags: daiquiriMnHTags,
                           variation: .daiquiri,
                           collection: .milkAndHoney)

var daiquiriMnHSpec: [CocktailIngredient] = [CocktailIngredient(.rums(.rumWhite), value: 2.0),
                                             CocktailIngredient(.juices(.lime), value: 0.875),
                                             CocktailIngredient(.syrups(.simple), value: 0.75)]

var daiquiriMnHTags = Tags(profiles: [.citrusy, .refreshing, .light],
                           styles: [.sour, .shaken])

