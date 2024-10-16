////
////  Paloma.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/24/23.
////

import SwiftUI


var paloma  = Cocktail(cocktailName: "Paloma",
                       glasswareType: .collins,
                       garnish: [.grapefruitPeel],
                       ice: .koldDraft,
                       spec: palomaSpec,
                       buildOrder: palomaBuild,
                       notes: palomaNotes,
                       tags: palomaTags)

var palomaSpec  = [OldCocktailIngredient(.juices(.lime), value: 0.5),
                   OldCocktailIngredient(.seasoning(.saline), value: 4, unit: .drops, prep: PrepBible.fiveToOneSaline),
                   OldCocktailIngredient(.soda(.grapefruitSoda), value: 3),
                   OldCocktailIngredient(.agaves(.tequilaBlanco), value: 1.5)]

var palomaTags  =  Tags(profiles: [.fruity, .refreshing, .light, .effervescent],
                        styles: [.built, .sour, .fizz])

var palomaBuild = Build(instructions: [Instruction(step: 1, method: "This is typically a built cocktail. Feel free to shake the ingredients that aren't soda to make it extra cold."),
                                       Instruction(step: 1, method: "We like to add saline into the cocktail rather than a pinch of salt. Some prefer a salt rim. Either way is fine."),])
