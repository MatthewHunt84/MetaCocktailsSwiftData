//
//  MexicanFiringSquad.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var mexicanFiringSquad = Cocktail(cocktailName: "Mexican Firing Squad(1939)",
                                  glasswareType: .doubleOld,
                                  garnish: [.orangeFlag, .pineappleWedge],
                                  ice: .crackedIce,
                                  author: charlesBaker,
                                  spec: mexicanFiringSquadSpec,
                                  tags: mexicanFiringSquadTags,
                                  variation: .mexicanFiringSquad)

var mexicanFiringSquadSpec = [CocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                              CocktailIngredient(.juices(.lime), value: 1),
                              CocktailIngredient(.syrups(.grenadine), value: 2, unit: .barSpoon),
                              CocktailIngredient(.agaves(.tequilaBlanco), value: 2)]

var mexicanFiringSquadTags = Tags( profiles: [.citrusy, .punchy, .tart],
                                   styles: [.sour, .shaken])
