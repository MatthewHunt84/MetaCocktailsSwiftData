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

var palomaNotes = "The pairing of grapefruit soda and tequila undoubtedly originated in Mexico. However, according to cocktail historian Dave Wondrich, the name 'Paloma' (Spanish for 'dove') wasn't associated with this drink until the 1990s in California. It was during this period that the Paloma began to gain widespread popularity. Long before that, the combination was enjoyed in Mexico with several different titles, depending the region. The drink's rise to fame outside its country of origin coincided with its christening, illustrating how naming can play a crucial role in a cocktail's recognition and popularity on the international stage."

var palomaBuild = Build(instructions: [Instruction(step: 1, method: "This is typically a built cocktail. Feel free to shake the ingredients that aren't soda to make it extra cold."),
                                       Instruction(step: 1, method: "We like to add saline into the cocktail rather than a pinch of salt. Some prefer a salt rim. Either way is fine."),])
