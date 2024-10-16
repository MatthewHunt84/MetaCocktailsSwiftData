//
//  HouseMexicanFiringSquad.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 10/14/24.
//

import Foundation

var houseMexicanFiringSquad = Cocktail(cocktailName: "Mexican Firing Squad" + houseTag,
                                       glasswareType: .doubleOld,
                                       garnish: [.limeWheel],
                                       ice: .koldDraft,
                                       spec: houseMexicanFiringSquadSpec,
                                       tags: houseMexicanFiringSquadTags,
                                       variation: .mexicanFiringSquad,
                                       collection: .house)

var houseMexicanFiringSquadSpec = [OldCocktailIngredient(.bitters(.angosturaBitters), value: 5, unit: .dashes),
                                   OldCocktailIngredient(.juices(.lime), value: 0.75),
                                   OldCocktailIngredient(.syrups(.grenadine), value: 1, prep: PrepBible.grenadine),
                                   OldCocktailIngredient(.agaves(.tequilaBlanco), value: 1.5),
                                   OldCocktailIngredient(.agaves(.mezcalSmokeyAny), value: 0.5)]

var houseMexicanFiringSquadTags = Tags( profiles: [.citrusy, .punchy, .fruity, .smokey],
                                        styles: [.sour, .shaken])
