//
//  PapaDoble(WnG).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/30/24.
//

import Foundation

let papaDobleWnG = Cocktail(cocktailName: "Hemingway Daiquiri (W&G Version)",
                            glasswareType: .coupe,
                            garnish: [.limeWheel],
                            author: williamsAndGraham,
                            spec: papaDobleSpec,
                            tags: papaDobleTags,
                            variation: .hemingwayDaiquiri,
                            collection: .williamsAndGraham)

var papaDobleSpec: [CocktailIngredient] = [CocktailIngredient(.syrups(.simple), value: 0.25),
                                           CocktailIngredient(.juices(.lime), value: 0.5),
                                           CocktailIngredient(.juices(.grapefruit), value: 0.75),
                                           CocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.5),
                                           CocktailIngredient(.rums(.plantation3Star), value: 2.0)]

var papaDobleTags = Tags(profiles: [.citrusy, .refreshing, .light],
                         styles: [.sour, .shaken])

