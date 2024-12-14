//
//  QueensParkSwizzle(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation


var queensParkSwizzleWnG = Cocktail(cocktailName: "Queens Park Swizzle" + wAndGTitleTag,
                                    glasswareType: .collins,
                                    garnish: [.mintSprig],
                                    ice: .pebbleIce,
                                    author: williamsAndGraham,
                                    spec: queensParkSpecWnG,
                                    buildOrder: queensParkBuildWnG,
                                    tags: queensParkTagsWnG,
                                    variation: .queensParkSwizzle,
                                    collection: .williamsAndGraham)

var queensParkSpecWnG = [OldCocktailIngredient(.herbs(.mint), value: 10, unit: .gentlyMuddled),
                         OldCocktailIngredient(.juices(.lime), value: 0.75),
                         OldCocktailIngredient(.syrups(.demSyrupOneToOne), value: 0.75, prep: PrepBible.demSyrupPrep),
                         OldCocktailIngredient(.rums(.plantationBarbados), value: 2.25),
                         OldCocktailIngredient(.bitters(.angosturaBitters), value: 5, unit: .dashes) ]

var queensParkTagsWnG = Tags(flavors: [.lime, .mint, .bakingSpices],
                             profiles: [.aromatic, .refreshing, .citrusy, .light],
                             styles: [.swizzle, .sour])

