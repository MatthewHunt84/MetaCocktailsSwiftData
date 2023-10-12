//
//  JungleBird.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/10/23.
//

import SwiftUI

var jungleBird = Cocktail(name: "JungleBird",
                          imageName: "empty-Cocktail",
                          glasswareType: .doubleOld,
                          garnish: [GarnishCatalog.pineappleFrond.asset, GarnishCatalog.pineappleWedge.asset],
                          ice: .bigRock,
                          author: "Aviary Bar at the Kuala Lumpur Hilton (1970's)",
                          spec: jungleBirdSpec,
                          buildOrder: nil,
                          tags: jungleBirdTags)

var jungleBirdSpec  =  [CocktailIngredient(name: .lime, value: 0.5, unit: .fluidOunces),
                        CocktailIngredient(name: .pineappleJuice, value: 2, unit: .fluidOunces),
                        CocktailIngredient(name: .simple, value: 0.5, unit: .fluidOunces),
                        CocktailIngredient(name: .campari, value: 0.75, unit: .fluidOunces),
                        CocktailIngredient(name: .agedJamaicanRum, value: 1.5, unit: .fluidOunces)]
                        
                        
                        
                        

var jungleBirdTags = Tags(flavors: [.pineapple, .lime, .fruity, .bitter],
                          profiles: [.aromatic, .bitter, .citrusy, .fruity],
                          textures: [.light],
                          styles: [.tiki, .shaken, .sour],
                          baseComponents: [.agedJamaicanRum])
