//
//  MexicanFiringSquad(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation


var mexicanFiringSquadWnG = Cocktail(cocktailName: "Mexican Firing Squad (W&G Version)",
                                     glasswareType: .doubleOld,
                                     garnish: [.limeWheel],
                                     ice: .bigRock,
                                     author: williamsAndGraham,
                                     spec: mexicanFiringSquadSpecWnG,
                                     tags: mexicanFiringSquadTagsWnG,
                                     variation: .mexicanFiringSquad,
                                     collection: .williamsAndGraham)

var mexicanFiringSquadSpecWnG = [OldCocktailIngredient(.bitters(.angosturaBitters), value: 4, unit: .dashes),
                                 OldCocktailIngredient(.juices(.lime), value: 0.75),
                                 OldCocktailIngredient(.syrups(.grenadine), value: 0.75, prep: PrepBible.grenadine),
                                 OldCocktailIngredient(.agaves(.tequilaOchoBlanco), value: 2)]

var mexicanFiringSquadTagsWnG = Tags( profiles: [.citrusy, .punchy, .fruity],
                                      styles: [.sour, .shaken])
