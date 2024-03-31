//
//  WhiteLady(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var whiteLadyWnG = Cocktail(cocktailName: "White Lady (W&G Version)",
                            glasswareType: .martini,
                            garnish: [.lemonPeel],
                            author: williamsAndGraham,
                            spec: whiteLadyWnGSpec,
                            tags: whiteLadyWnGTags,
                            collection: .williamsAndGraham)

var whiteLadyWnGSpec  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                         CocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                         CocktailIngredient(.liqueurs(.cointreau), value: 0.75),
                         CocktailIngredient(.gins(.fordsGin), value: 2)]


var whiteLadyWnGTags = Tags(profiles: [.citrusy, .fruity, .light, .silky, .dry],
                            styles: [.daisy, .shaken])

