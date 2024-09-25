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
                         notes: margNotes,
                         tags: margaritaTags,
                         variation: .margarita,
                         titleCocktail: true)

var margaritaSpec = [OldCocktailIngredient(.juices(.lime), value: 0.75),
                     OldCocktailIngredient(.liqueurs(.cointreau), value: 1),
                     OldCocktailIngredient(.agaves(.tequilaBlanco), value: 2)]

var margaritaTags = Tags( profiles: [.citrusy, .tart, .punchy],
                          styles: [.daisy, .shaken, .sour])


var margNotes = "The term 'Margarita' translates to 'daisy' in Spanish. In cocktail parlance, a daisy refers to a classic drink style akin to a sour, but it substitutes liqueur for syrup. Margaritas typically have a tart flavor profile. For those who prefer a more balanced taste, consider adding 0.25 oz of simple syrup or agave nectar to suit your palate. The Margarita's origins are disputed, with numerous individuals claiming to have invented it, making it difficult to attribute its creation to any single person."
