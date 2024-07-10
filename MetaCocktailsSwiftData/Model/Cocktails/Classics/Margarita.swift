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
                         tags: margaritaTags,
                         variation: .margarita,
                         titleCocktail: true)

var margaritaSpec = [OldCocktailIngredient(.juices(.lime), value: 0.75),
                     OldCocktailIngredient(.liqueurs(.cointreau), value: 0.75),
                     OldCocktailIngredient(.agaves(.tequilaBlanco), value: 1.5)]

var margaritaTags = Tags( profiles: [.citrusy, .tart, .punchy],
                          styles: [.daisy, .shaken, .sour])

