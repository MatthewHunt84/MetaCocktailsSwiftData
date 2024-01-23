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
                          spec: margaritaTommysSpec,
                          tags: margaritaTommysTags)

var margaritaTommysSpec = [CocktailIngredient(.juices(.lime), value: 1),
                           CocktailIngredient(.syrups(.agaveSyrup), value: 1),
                           CocktailIngredient(.agaves(.tequilaBlanco), value: 2),
                           CocktailIngredient(.seasoning(.salt), value: 1, unit: .rim)]

var margaritaTommysTags = Tags( profiles: [.citrusy],
                                textures: [.light],
                                styles: [.sour, .shaken])
