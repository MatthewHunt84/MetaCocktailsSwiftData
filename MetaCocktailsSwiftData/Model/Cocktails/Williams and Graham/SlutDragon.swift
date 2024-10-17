//
//  SlutDragon.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation


var slutDragon = Cocktail(cocktailName: "Slut Dragon",
                         glasswareType: .doubleOldCelerySalt,
                         garnish: [.celeryTop],
                         ice: .bigRock,
                         author:Author(person: AuthorNames.jamesMenkal.rawValue,
                                       place: AuthorPlaces.williamsAndGraham.rawValue, year: "2021"),
                         spec: slutDragonSpec,
                         tags: slutDragonTags,
                          collection: .williamsAndGraham)

let slutDragonSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.bitters(.celeryBitters), value: 2, unit: .dashes),
                                           OldCocktailIngredient(.juices(.lime), value: 0.75),
                                           OldCocktailIngredient(.syrups(.agaveSyrup), value: 0.5, prep: PrepBible.agaveSyrup),
                                           OldCocktailIngredient(.syrups(.gingerSyrup), value: 0.25, prep: PrepBible.gingerSyrup),
                                           OldCocktailIngredient(.liqueurs(.salersAperitif), value: 0.5),
                                           OldCocktailIngredient(.agaves(.tequilaOchoBlanco), value: 1.5)]
                                        

let slutDragonTags = Tags(profiles: [.herbal, .refreshing, .vegetal, .savory, .light],
                      styles: [.sour, .shaken])

