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
                       notes: palomaNote,
                       tags: palomaTags)

var palomaSpec  = [OldCocktailIngredient(.juices(.lime), value: 0.5),
                   OldCocktailIngredient(.seasoning(.saline), value: 4, unit: .drops, prep: PrepBible.fiveToOneSaline),
                   OldCocktailIngredient(.soda(.grapefruitSoda), value: 3),
                   OldCocktailIngredient(.agaves(.tequilaBlanco), value: 1.5)]

var palomaTags  =  Tags(profiles: [.fruity, .refreshing, .light, .effervescent],
                        styles: [.built, .sour, .fizz])


