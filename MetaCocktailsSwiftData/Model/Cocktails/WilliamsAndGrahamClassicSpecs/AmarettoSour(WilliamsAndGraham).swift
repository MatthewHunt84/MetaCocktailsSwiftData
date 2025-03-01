//
//  AmarettoSour.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var amarettoSourWnG  = Cocktail(cocktailName: "Amaretto Sour" + wAndGTitleTag,
                                glasswareType: .martini,
                                garnish: [.maraschinoCherry],
                                author: williamsAndGraham,
                                spec: amarettoSourWnGSpec,
                                buildOrder: eggWhiteBittersDecoInstructions,
                                tags: amarettoSourWnGTags,
                                variation: .amarettoSour,
                                collection: .williamsAndGraham)

var amarettoSourWnGSpec  = [OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                            OldCocktailIngredient(.juices(.lemon), value: 0.75),
                            OldCocktailIngredient(.syrups(.demSyrupOneToOne), value: 0.25, prep: PrepBible.demSyrupPrep),
                            OldCocktailIngredient(.liqueurs(.amaretto) , value: 2),
                            OldCocktailIngredient(.bitters(.angosturaBitters) , value: 10, unit: .drops)]



var amarettoSourWnGTags   = Tags(profiles: [.citrusy, .refreshing, .light],
                                 styles: [.shaken, .sour])

