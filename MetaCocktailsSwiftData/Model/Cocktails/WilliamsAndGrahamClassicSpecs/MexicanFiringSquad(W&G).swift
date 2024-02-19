//
//  MexicanFiringSquad(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation


var mexicanFiringSquadWnG = Cocktail(cocktailName: "Mexican Firing Squad(W&G Version)",
                                     glasswareType: .doubleOld,
                                     garnish: [.limeWheel],
                                     ice: .bigRock,
                                     author: williamsAndGraham,
                                     spec: mexicanFiringSquadSpecWnG,
                                     tags: mexicanFiringSquadTagsWnG,
                                     variation: .mexicanFiringSquad)

var mexicanFiringSquadSpecWnG = [CocktailIngredient(.bitters(.angosturaBitters), value: 4, unit: .dashes),
                                 CocktailIngredient(.juices(.lime), value: 0.75),
                                 CocktailIngredient(.syrups(.grenadine), value: 0.75),
                                 CocktailIngredient(.agaves(.tequilaOchoBlanco), value: 2)]

var mexicanFiringSquadTagsWnG = Tags( profiles: [.citrusy, .punchy, .fruity],
                                      styles: [.sour, .shaken])
