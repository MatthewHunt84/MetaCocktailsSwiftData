//
//  Margarita.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/20/23.
//

import SwiftUI

var margarita = Cocktail(cocktailName: "Margarita",
                         glasswareType: .doubleOldSalt,
                          garnish: [.limeWheel],
                          ice: .koldDraft,
                          spec: margaritaSpec,
                          tags: margaritaTags)

var margaritaSpec = [CocktailIngredient( .lime, value: 1),
                     CocktailIngredient( .cointreau, value: 1),
                     CocktailIngredient( .tequilaBlanco, value: 0.375),]



var margaritaTags = Tags( profiles: [.citrusy, .tart],
                          textures: [.light],
                          styles: [.sour, .shaken],
                          bases: [.tequilaBlanco])
