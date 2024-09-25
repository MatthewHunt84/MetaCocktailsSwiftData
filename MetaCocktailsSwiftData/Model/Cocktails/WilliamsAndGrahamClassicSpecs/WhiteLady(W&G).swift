//
//  WhiteLady(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var whiteLadyWnG = Cocktail(cocktailName: "White Lady" + wAndGTitleTag,
                            glasswareType: .martini,
                            garnish: [.lemonPeel],
                            author: williamsAndGraham,
                            spec: whiteLadyWnGSpec,
                            tags: whiteLadyWnGTags,
                            variation: .whiteLady,
                            collection: .williamsAndGraham)

var whiteLadyWnGSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                         OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                         OldCocktailIngredient(.liqueurs(.cointreau), value: 0.75),
                         OldCocktailIngredient(.gins(.fordsGin), value: 2)]


var whiteLadyWnGTags = Tags(profiles: [.citrusy, .fruity, .light, .silky, .dry],
                            styles: [.daisy, .shaken])

