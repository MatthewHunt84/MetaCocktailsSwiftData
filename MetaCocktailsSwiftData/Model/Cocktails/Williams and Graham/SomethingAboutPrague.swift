//
//  SomethingAboutPrague.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var somethingAboutPrague = Cocktail(cocktailName: "Something About Prague",
                                    imageAsset: nil,
                                    glasswareType: .doubleOld,
                                    garnish: [.nutmeg],
                                    ice: .koldDraft,
                                    author: Author(place: AuthorPlaces.williamsAndGraham.rawValue),
                                    spec: somethingAboutPragueSpec,
                                    tags: somethingAboutPragueTags)

let somethingAboutPragueSpec: [CocktailIngredient] = [CocktailIngredient(.fruit(.orangeMoons), value: 2, unit: .muddled),
                                                      CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dash),
                                                      CocktailIngredient(.juices(.lemon), value: 0.5),
                                                      CocktailIngredient(.syrups(.orgeat), value: 0.75, prep: PrepBibleViewModel().orgeat),
                                                      CocktailIngredient(.amari(.becherovka), value: 0.75),
                                                      CocktailIngredient(.whiskies(.eagleRare10), value: 1.5)]


let somethingAboutPragueTags = Tags(profiles: [.refreshing, .complex, .nutty, .fruity],
                                    styles: [.sour, .shaken])

