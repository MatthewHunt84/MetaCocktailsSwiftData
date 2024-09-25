//
//  PapaDoble(WnG).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/30/24.
//

import Foundation

let papaDobleWnG = Cocktail(cocktailName: "Hemingway Daiquiri" + wAndGTitleTag,
                            glasswareType: .coupe,
                            garnish: [.limeWheel],
                            author: williamsAndGraham,
                            spec: papaDobleSpec,
                            tags: papaDobleTags,
                            variation: .hemingwayDaiquiri,
                            collection: .williamsAndGraham)

var papaDobleSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.syrups(.simple), value: 0.25, prep: PrepBible.simpleSyrupPrep),
                                           OldCocktailIngredient(.juices(.lime), value: 0.5),
                                           OldCocktailIngredient(.juices(.grapefruit), value: 0.75),
                                           OldCocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.5),
                                           OldCocktailIngredient(.rums(.plantation3Star), value: 2.0)]

var papaDobleTags = Tags(profiles: [.citrusy, .refreshing, .light],
                         styles: [.sour, .shaken])

