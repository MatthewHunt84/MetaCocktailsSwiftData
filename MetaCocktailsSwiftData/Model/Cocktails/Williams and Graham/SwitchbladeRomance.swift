//
//  SwitchbladeRomance.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var switchbladeRomance = Cocktail(cocktailName: "Switchblade Romance",
                                  imageAsset: nil,
                                  glasswareType: .singleOld,
                                  garnish: [.lemonPeel],
                                  ice: nil,
                                  author:Author(place: AuthorPlaces.williamsAndGraham.rawValue),
                                  spec: switchbladeRomanceSpec,
                                  tags: switchbladeRomanceTags)

let switchbladeRomanceSpec: [CocktailIngredient] = [CocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                                                    CocktailIngredient(.juices(.lemon), value: 0.5),
                                                    CocktailIngredient(.syrups(.orgeat), value: 0.75),
                                                    CocktailIngredient(.fortifiedWines(.byrrh), value: 0.5),
                                                    CocktailIngredient(.bitters(.angosturaBitters), value: 0.25),
                                                    CocktailIngredient(.rums(.plantationPineapple), value: 2)]


let switchbladeRomanceTags = Tags(profiles: [.nutty, .refreshing, .silky, .complex],
                                  styles: [.sour, .shaken])

