//
//  BinAndGitters.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation



var binAndGitters = Cocktail(cocktailName: "Bin & Gitters",
                             imageAsset: nil,
                             glasswareType: .doubleOld,
                             garnish: [.limeWedge],
                             ice: .pebbleIce,
                             author: Author(person: AuthorNames.sashaPetraske.rawValue ,
                                            place: AuthorPlaces.milkAndHoney.rawValue,
                                            year: "Early 2000s"),
                             spec: binAndGittersSpec,
                             buildOrder: nil ,
                             tags: binAndGittersTags,
                             variation: nil,
                             collection: .milkAndHoney,
                             titleCocktail: false)

let binAndGittersSpec: [CocktailIngredient] = [CocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .floatedDashes),
                                               CocktailIngredient(.juices(.lime), value: 1),
                                               CocktailIngredient(.syrups(.simple), value: 0.75),
                                               CocktailIngredient(.gins(.ginAny), value: 2)]

let binAndGittersTags = Tags(profiles: [.refreshing, .light],
                             styles: [.sour, .shaken])
