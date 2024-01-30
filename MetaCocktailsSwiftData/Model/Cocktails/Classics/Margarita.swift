////
////  Margarita.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////

import SwiftUI

var margarita = Cocktail(cocktailName: "Margarita",
                         glasswareType: .coupeSalt,
                         garnish: [.noGarnish],
                         ice: nil,
                         spec: margaritaSpec,
                         tags: margaritaTags)

var margaritaSpec = [CocktailIngredient(.juices(.lime), value: 0.75),
                     CocktailIngredient(.liqueurs(.cointreau), value: 0.67628),
                     CocktailIngredient(.agaves(.tequilaBlanco), value: 1.5)]

var margaritaTags = Tags( profiles: [.citrusy, .tart, .punchy],
                          styles: [.sour, .shaken])

