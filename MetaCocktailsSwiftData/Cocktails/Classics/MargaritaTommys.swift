//
//  MargaritaTommys.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/20/23.
//

import SwiftUI

var margaritaTommys = Cocktail(cocktailName: "Margarita (Tommy's)",
                         glasswareType: .doubleOldSalt,
                          garnish: [.limeWheel],
                          ice: .koldDraft,
                          spec: margaritaTommysSpec,
                          tags: margaritaTommysTags)

var margaritaTommysSpec = [CocktailIngredient( .lime, value: 1),
                     CocktailIngredient( .agaveSyrup, value: 1),
                     CocktailIngredient( .tequilaBlanco, value: 2),]



var margaritaTommysTags = Tags( profiles: [.citrusy, .tart],
                          textures: [.light],
                          styles: [.sour, .shaken],
                          agave: [.tequilaBlanco])
