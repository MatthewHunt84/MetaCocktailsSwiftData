//
//  LemonDrop(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var lemonDropWnG = Cocktail(cocktailName: "Lemon Drop" + wAndGTitleTag,
                            glasswareType: .sugarRimStemmed,
                            garnish: [.lemonWheel],
                            ice: nil,
                            author: williamsAndGraham,
                            spec: lemonDropSpecWnG,
                            tags: lemonDropTagsWnG,
                            variation: .lemonDrop,
                            collection: .williamsAndGraham)

var lemonDropSpecWnG  = [OldCocktailIngredient(.juices(.lemon), value: 1),
                         OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                         OldCocktailIngredient(.syrups(.vanilla), value: 0.25, prep: PrepBible.vanillaSyrup),
                         OldCocktailIngredient(.vodkas(.vodkaAny), value: 2)]

var lemonDropTagsWnG = Tags(profiles: [.refreshing, .citrusy, .light],
                       styles: [.sour, .shaken])
                       
