//
//  QueensParkSwizzle(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation


var queensParkSwizzleWnG = Cocktail(cocktailName: "Queens Park Swizzle(W&G Version)",
                                    glasswareType: .collins,
                                    garnish: [.mintSprig],
                                    ice: .pebbleIce,
                                    author: williamsAndGraham,
                                    spec: queensParkSpecWnG,
                                    buildOrder: queensParkBuildWnG,
                                    tags: queensParkTagsWnG)

var queensParkSpecWnG = [CocktailIngredient(.herbs(.mint), value: 10, unit: .gentlyMuddled),
                         CocktailIngredient(.juices(.lime), value: 0.75),
                         CocktailIngredient(.syrups(.demSyrupOneToOne), value: 0.75),
                         CocktailIngredient(.rums(.plantationBarbados), value: 2.25),
                         CocktailIngredient(.bitters(.angosturaBitters), value: 5, unit: .dashes) ]

var queensParkTagsWnG = Tags(flavors: [.lime, .mint, .bakingSpices],
                             profiles: [.aromatic, .refreshing, .citrusy, .light],
                             styles: [.swizzle, .sour])

var queensParkBuildWnG = Build(instructions: [Instruction(step: 1, method: "Add mint to the bottom of the collins glass and gently press to release mint oils. Do not muddle"),
                                              Instruction(step: 2, method: "Pack the glass with pebble ice and add the rest of the ingredients, besides the angostura bitters, and swizzle. Try to keep the mint at the bottom of the glass."),
                                              Instruction(step: 3, method: "Pack the glass with more ice to fill and then add the Angostura bitters."),
                                              Instruction(step: 4, method: "Garnish with a mint sprig.")])
