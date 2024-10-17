//
//  SomethingAboutPrague.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var somethingAboutPrague = Cocktail(cocktailName: "Something About Prague",
                                    glasswareType: .doubleOld,
                                    garnish: [.nutmeg],
                                    ice: .koldDraft,
                                    author: Author(person: AuthorNames.samJohnson.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue),
                                    spec: somethingAboutPragueSpec,
                                    tags: somethingAboutPragueTags,
                                    collection: .williamsAndGraham)

let somethingAboutPragueSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.fruit(.orangeMoons), value: 2, unit: .muddled),
                                                      OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                                                      OldCocktailIngredient(.juices(.lemon), value: 0.5),
                                                      OldCocktailIngredient(.syrups(.orgeat), value: 0.75, prep: PrepBible.orgeat),
                                                      OldCocktailIngredient(.amari(.becherovka), value: 0.75),
                                                      OldCocktailIngredient(.whiskies(.eagleRare10), value: 1.5)]


let somethingAboutPragueTags = Tags(flavors: [.nutmeg],
                                    profiles: [.refreshing, .complex, .nutty, .fruity],
                                    styles: [.sour, .shaken])

