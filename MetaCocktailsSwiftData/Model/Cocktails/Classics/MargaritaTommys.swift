//
////  MargaritaTommys.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////

import SwiftUI

var margaritaTommys = Cocktail(cocktailName: "Margarita (Tommy's)",
                               glasswareType: .doubleOldSalt,
                               garnish: [.limeWheel],
                               ice: .koldDraft,
                               author: Author(person: "Julio Bermejo", place: "Tommy's Mexican Restaurant", year: "1990"),
                               spec: margaritaTommysSpec,
                               tags: margaritaTommysTags)

var margaritaTommysSpec = [CocktailIngredient(.juices(.lime), value: 1),
                           CocktailIngredient(.syrups(.agaveSyrup), value: 1),
                           CocktailIngredient(.agaves(.tequilaBlanco), value: 2)]

var margaritaTommysTags = Tags( profiles: [.citrusy, .punchy],
                                styles: [.sour, .shaken])
