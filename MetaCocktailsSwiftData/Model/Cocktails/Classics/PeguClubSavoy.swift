//
//  PeguClubSavoy.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/17/24.
//

import Foundation

var peguClubSavoy = Cocktail(cocktailName: "Pegu Club Cocktail (Savoy)",
                             glasswareType: .stemmedGlassware,
                             ice: nil,
                             author:Author(person: AuthorNames.harryCraddock.rawValue, place: AuthorPlaces.savoy.rawValue, year: "1930"),
                             spec: peguClubSavoySpec,
                             buildOrder: peguClubSavoyBuild,
                             tags: peguClubSavoyTags,
                             variation: .peguClub)

var peguClubSavoySpec  = [OldCocktailIngredient(.bitters(.orangeBitters), value: 1, unit: .dashes),
                          OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                          OldCocktailIngredient(.juices(.lime), value: 1, unit: .teaspoon),
                          OldCocktailIngredient(.liqueurs(.orangeCuracao), value: 1),
                          OldCocktailIngredient(.gins(.ginAny), value: 2)]

var peguClubSavoyTags = Tags(profiles: [.citrusy, .tart, .light, .restorative],
                             styles: [.daisy, .shaken, .sour])


let peguClubSavoyBuild = Build(instructions: [Instruction(step: 1, method: "Shake well and strain into a cocktail glass. The favourite cocktail at tthe Pegu CLub, Burma, and the one that has travelled, and is asked for, around the world. -Harry Craddock")])