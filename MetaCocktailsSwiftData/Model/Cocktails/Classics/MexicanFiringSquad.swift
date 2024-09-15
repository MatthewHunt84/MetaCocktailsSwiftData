//
//  MexicanFiringSquad.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var mexicanFiringSquad = Cocktail(cocktailName: "Mexican Firing Squad",
                                  glasswareType: .doubleOld,
                                  garnish: [.maraschinoCherry, .halfOrangeWheel, .pineappleWedge],
                                  ice: .crackedIce,
                                  author: charlesBaker,
                                  spec: mexicanFiringSquadSpec,
                                  tags: mexicanFiringSquadTags,
                                  variation: .mexicanFiringSquad,
                                  collection: .originals,
                                  titleCocktail: true)

var mexicanFiringSquadSpec = [OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                              OldCocktailIngredient(.juices(.lime), value: 1),
                              OldCocktailIngredient(.syrups(.grenadine), value: 2, unit: .barSpoon, prep: PrepBible.grenadine),
                              OldCocktailIngredient(.agaves(.tequilaBlanco), value: 2)]

var mexicanFiringSquadTags = Tags( profiles: [.citrusy, .punchy, .tart],
                                   styles: [.sour, .shaken])
