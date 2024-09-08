//
//  StreetAndFlynnSpecial.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/13/24.
//

import Foundation

var streetAndFlynnSpecial = Cocktail(cocktailName: "Street & Flynn Special",
                                     glasswareType: .collins,
                                     garnish: nil,
                                     ice: .koldDraft ,
                                     author:Author(person: AuthorNames.josephSchwartz.rawValue ,
                                                   place: AuthorPlaces.milkAndHoney.rawValue ,
                                                   year: "Early 2000s"),
                                     spec: streetAndFlynnSpecialSpec,
                                     buildOrder: streetAndFlynnSpecialBuild,
                                     tags: streetAndFlynnSpecialTags,
                                     variation: nil ,
                                     collection: .milkAndHoney)

var streetAndFlynnSpecialSpec     =  [OldCocktailIngredient(.soda(.sodaWater), value: 2),
                                      OldCocktailIngredient(.syrups(.gingerSyrup), value: 0.5),
                                      OldCocktailIngredient(.juices(.lime), value: 0.5),
                                      OldCocktailIngredient(.liqueurs(.pimentoDram), value: 0.5),
                                      OldCocktailIngredient(.rums(.corubaDark), value: 1.5)]

var streetAndFlynnSpecialTags     = Tags(profiles: [.savory, .refreshing, .complex],
                                         styles: [.fizz, .shaken])

var streetAndFlynnSpecialBuild = Build(instructions: [Instruction(step: 1, method: "Combine the rum, dram, ginger syrup, and lime juice in a cocktail shaker and shake vigorously until the drink is sufficiently chilled."),
                                                      Instruction(step: 2, method: "Strain into a Collins glass filled with 3 medium ice cubes and top off with club soda."),
                                                      Instruction(step: 3, method: "Serve with a straw.")])
