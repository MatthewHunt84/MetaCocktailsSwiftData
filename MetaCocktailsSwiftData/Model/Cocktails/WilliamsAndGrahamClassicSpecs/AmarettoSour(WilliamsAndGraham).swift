//
//  AmarettoSour.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var amarettoSourWnG  = Cocktail(cocktailName: "Amaretto Sour(W&G)",
                                glasswareType: .martini,
                                garnish: [.maraschinoCherry],
                                author: williamsAndGraham,
                                spec: amarettoSourWnGSpec,
                                buildOrder: eggWhiteBittersDecoInstructions,
                                tags: amarettoSourWnGTags)

var amarettoSourWnGSpec  = [CocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                            CocktailIngredient(.juices(.lemon), value: 0.75),
                            CocktailIngredient(.syrups(.demSyrupOneToOne), value: 0.25),
                            CocktailIngredient(.liqueurs(.amaretto) , value: 2),
                            CocktailIngredient(.bitters(.angosturaBitters) , value: 1, unit: .bittersDeco)]



var amarettoSourWnGTags   = Tags(profiles: [.citrusy, .refreshing, .light],
                                 styles: [.shaken, .sour])

