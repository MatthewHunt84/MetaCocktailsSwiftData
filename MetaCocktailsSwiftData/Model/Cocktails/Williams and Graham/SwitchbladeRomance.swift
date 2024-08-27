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
                                  author:Author(person: AuthorNames.christinaAndrews.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue),
                                  spec: switchbladeRomanceSpec,
                                  tags: switchbladeRomanceTags,
                                  collection: .williamsAndGraham)

let switchbladeRomanceSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                                                    OldCocktailIngredient(.juices(.lemon), value: 0.5),
                                                    OldCocktailIngredient(.syrups(.orgeat), value: 0.75, prep: PrepBible.orgeat),
                                                    OldCocktailIngredient(.fortifiedWines(.byrrh), value: 0.5),
                                                    OldCocktailIngredient(.bitters(.angosturaBitters), value: 0.25),
                                                    OldCocktailIngredient(.rums(.plantationPineapple), value: 2)]


let switchbladeRomanceTags = Tags(profiles: [.nutty, .refreshing, .silky, .complex],
                                  styles: [.sour, .shaken])

