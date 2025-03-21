//
//  Daiquiri(M&H).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/6/24.
//

import Foundation

let daiquiriMnH = Cocktail(cocktailName: "Daiquiri" + mAndHVersionTag,
                           glasswareType: .coupe,
                           garnish: nil,
                           author: Author(place: AuthorPlaces.milkAndHoney.rawValue, year: "Early 2000s"),
                           spec: daiquiriMnHSpec,
                           tags: daiquiriMnHTags,
                           variation: .daiquiri,
                           collection: .milkAndHoney)

var daiquiriMnHSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.rums(.rumWhite), value: 2.0),
                                                OldCocktailIngredient(.juices(.lime), value: 0.875),
                                                OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep)]

var daiquiriMnHTags = Tags(profiles: [.citrusy, .refreshing, .light],
                           styles: [.sour, .shaken])

