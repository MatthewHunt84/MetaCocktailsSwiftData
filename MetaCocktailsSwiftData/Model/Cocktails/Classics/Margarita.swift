////
////  Margarita.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////

import SwiftUI

var margarita = Cocktail(cocktailName: "Margarita",
                         glasswareType: .doubleOldSalt,
                          garnish: [.limeWheel],
                          ice: .koldDraft,
                          spec: margaritaSpec,
                          tags: margaritaTags)

var margaritaSpec = [CocktailIngredient(.juices(.lime), value: 1),
                     CocktailIngredient(.liqueurs(.cointreau), value: 1),
                     CocktailIngredient(.agaves(.tequilaBlanco), value: 2),
                     CocktailIngredient(.seasoning(.salt), value: 1, unit: .rim)]

var margaritaTags = Tags( profiles: [.citrusy, .tart, .punchy],
                          styles: [.sour, .shaken])
                        
