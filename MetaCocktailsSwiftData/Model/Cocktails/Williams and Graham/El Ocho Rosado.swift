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

var elOchoRosadoSpec = [CocktailIngredient(.bitters(.lemonBitters), value: 2, unit: .dashes),
                        CocktailIngredient(.fortifiedWines(.hidalgoManzanilla), value: 0.5),
                        CocktailIngredient(.fortifiedWines(.lilletRose), value: 1),
                        CocktailIngredient(.agaves(.tequilaOchoBlanco), value: 1.5)]

var elOchoRosadoTags = Tags(profiles: [.complex, .dry, .punchy],
                            styles: [.martini, .stirred])
