//
//  LemonDrop(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var lemonDropWnG = Cocktail(cocktailName: "Lemon Drop(W&G Version)",
                            glasswareType: .sugarRimStemmed,
                            garnish: [.lemonWheel],
                            ice: nil,
                            author: williamsAndGraham,
                            spec: lemonDropSpecWnG,
                            tags: lemonDropTagsWnG,
                            variation: .lemonDrop,
                            collection: .williamsAndGraham)

var lemonDropSpecWnG  = [CocktailIngredient(.juices(.lemon), value: 1),
                         CocktailIngredient(.syrups(.simple), value: 0.75),
                         CocktailIngredient(.syrups(.vanilla), value: 0.25),
                         CocktailIngredient(.vodkas(.vodkaAny), value: 2)]

var lemonDropTagsWnG = Tags(profiles: [.refreshing, .citrusy, .light],
                       styles: [.sour, .shaken])
                       
