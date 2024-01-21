//
//  SlutDragon.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation


var slutDragon = Cocktail(cocktailName: "Slut Dragon (Aka: Soul Bond)",
                         imageAsset: nil,
                         glasswareType: .doubleOldCelerySalt,
                         garnish: [.celeryTop],
                         ice: .bigRock,
                         author: [Authors.jamesMenkal.rawValue, Authors.williamsAndGraham.rawValue],
                         spec: slutDragonSpec,
                         tags: slutDragonTags)

let slutDragonSpec: [CocktailIngredient] = [CocktailIngredient(.bitters(.celeryBitters), value: 2, unit: .dashes),
                                           CocktailIngredient(.juices(.lime), value: 0.75),
                                           CocktailIngredient(.syrups(.agaveSyrup), value: 0.5),
                                           CocktailIngredient(.syrups(.gingerSyrup), value: 0.25),
                                           CocktailIngredient(.liqueurs(.salersAperitif), value: 0.5),
                                           CocktailIngredient(.agaves(.tequilaOchoBlanco), value: 1.5)]
                                        

let slutDragonTags = Tags(profiles: [.herbal, .refreshing, .vegetal],
                      textures: [.light],
                      styles: [.sour, .shaken])

