//
//  ModernCocktail(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var modernCocktailWnG = Cocktail(cocktailName: "Modern Cocktail(WnG Version)",
                                 glasswareType: .stemmedGlassware,
                                 garnish: [.lemonPeel],
                                 ice: nil,
                                 author: williamsAndGraham,
                                 spec: modernCocktailSpecWnG,
                                 tags: modernCocktailTagsWnG,
                                 variation: .modernCocktail,
                                 collection: .williamsAndGraham)

var modernCocktailSpecWnG = [OldCocktailIngredient(.bitters(.orangeBitters), value: 1, unit: .dashes),
                             OldCocktailIngredient(.juices(.lemon), value: 0.75),
                             OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                             OldCocktailIngredient(.otherAlcohol(.absinthe), value: 4, unit: .sprays),
                             OldCocktailIngredient(.whiskies(.glenfiddich12), value: 1),
                             OldCocktailIngredient(.liqueurs(.plymouthSloeGin), value: 1)]

var modernCocktailTagsWnG = Tags(profiles: [.citrusy, .fruity, .light, .complex, .refreshing],
                                 styles: [.sour, .shaken])
