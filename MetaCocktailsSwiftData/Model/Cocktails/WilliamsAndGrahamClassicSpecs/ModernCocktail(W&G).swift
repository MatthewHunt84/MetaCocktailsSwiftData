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

var modernCocktailSpecWnG = [CocktailIngredient(.bitters(.orangeBitters), value: 1, unit: .dash),
                             CocktailIngredient(.juices(.lemon), value: 0.75),
                             CocktailIngredient(.syrups(.simple), value: 0.75),
                             CocktailIngredient(.otherAlcohol(.absinthe), value: 4, unit: .spraysInGlass),
                             CocktailIngredient(.whiskies(.glenfiddich12), value: 1),
                             CocktailIngredient(.liqueurs(.plymouthSloeGin), value: 1)]

var modernCocktailTagsWnG = Tags(profiles: [.citrusy, .fruity, .light, .complex, .refreshing],
                                 styles: [.sour, .shaken])
