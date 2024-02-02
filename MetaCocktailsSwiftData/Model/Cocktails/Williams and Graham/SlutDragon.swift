//
//  SlutDragon.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation


var slutDragon = Cocktail(cocktailName: "Slut Dragon(AKA: Soul Bond)",
                         imageAsset: nil,
                         glasswareType: .doubleOldCelerySalt,
                         garnish: [.celeryTop],
                         ice: .bigRock,
                         author:Author(person: AuthorNames.jamesMenkal.rawValue,
                                       place: AuthorPlaces.williamsAndGraham.rawValue),
                         spec: slutDragonSpec,
                         tags: slutDragonTags)

let slutDragonSpec: [CocktailIngredient] = [CocktailIngredient(.bitters(.celeryBitters), value: 2, unit: .dashes),
                                           CocktailIngredient(.juices(.lime), value: 0.75),
                                           CocktailIngredient(.syrups(.agaveSyrup), value: 0.5),
                                           CocktailIngredient(.syrups(.gingerSyrup), value: 0.25),
                                           CocktailIngredient(.liqueurs(.salersAperitif), value: 0.5),
                                           CocktailIngredient(.agaves(.tequilaOchoBlanco), value: 1.5)]
                                        

let slutDragonTags = Tags(profiles: [.herbal, .refreshing, .vegetal, .savory, .light],
                      styles: [.sour, .shaken])

