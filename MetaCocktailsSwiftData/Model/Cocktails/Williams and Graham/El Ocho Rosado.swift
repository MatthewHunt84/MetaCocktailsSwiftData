//
//  El Ocho Rosado.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation



var elOchoRosado  =  Cocktail(cocktailName: "El Ocho Rosado",
                              glasswareType: .doubleOld,
                              garnish: [.lemonPeel],
                              ice: .bigRock,
                              author:justWnG,
                              spec: elOchoRosadoSpec,
                              tags: elOchoRosadoTags,
                              collection: .williamsAndGraham)

var elOchoRosadoSpec = [OldCocktailIngredient(.bitters(.lemonBitters), value: 2, unit: .dashes),
                        OldCocktailIngredient(.fortifiedWines(.hidalgoManzanilla), value: 0.5),
                        OldCocktailIngredient(.fortifiedWines(.lilletRose), value: 1),
                        OldCocktailIngredient(.agaves(.tequilaOchoBlanco), value: 1.5)]

var elOchoRosadoTags = Tags(profiles: [.complex, .dry, .punchy],
                            styles: [.martini, .stirred])
