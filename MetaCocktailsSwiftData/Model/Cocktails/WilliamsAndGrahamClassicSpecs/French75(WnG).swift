//
//  French75(WnG).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/26/24.
//

import Foundation

var french75WnG  = Cocktail(cocktailName: "French 75 (W&G Version)",
                            glasswareType: .flute,
                            garnish: [.lemonPeel],
                            ice: nil,
                            author: williamsAndGraham,
                            spec: french75WnGSpec,
                            buildOrder: french75CognacBuild,
                            tags: french75CognacTags,
                            variation: .french75,
                            collection: .williamsAndGraham)

var french75WnGSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                        OldCocktailIngredient(.syrups(.simple), value: 0.75),
                        OldCocktailIngredient(.brandies(.pFAmber), value: 1.5),
                        OldCocktailIngredient(.wines(.prosecco), value: 2)]

