//
//  JungleBird.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/10/23.
//

import SwiftUI

var jungleBird = Cocktail(cocktailName: "JungleBird",
                          glasswareType: .doubleOld,
                          garnish: [.pineappleFrond, .pineappleWedge],
                          ice: .bigRock,
                          author: "Aviary Bar at the Kuala Lumpur Hilton (1970's)",
                          spec: jungleBirdSpec,
                          buildOrder: nil,
                          tags: jungleBirdTags)

var jungleBirdSpec  =  [CocktailIngredient( .lime, value: 0.5),
                        CocktailIngredient( .pineappleJuice, value: 2),
                        CocktailIngredient( .simple, value: 0.5),
                        CocktailIngredient( .campari, value: 0.75),
                        CocktailIngredient( .agedJamaicanRum, value: 1.5)]
                        
                        
                        
                        

var jungleBirdTags = Tags(flavors: [.pineapple, .lime],
                          profiles: [.aromatic, .bitter, .citrusy, .fruity],
                          textures: [.light],
                          styles: [.tiki, .shaken, .sour],
                          bases: [.agedJamaicanRum])
