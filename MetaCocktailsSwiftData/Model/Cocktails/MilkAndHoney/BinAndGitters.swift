//
//  BinAndGitters.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation



var binAndGitters = Cocktail(cocktailName: "Bin & Gitters",
                             glasswareType: .doubleOld,
                             garnish: [.limeWedge],
                             ice: .pebbleIce,
                             author: Author(person: AuthorNames.sashaPetraske.rawValue ,
                                            place: AuthorPlaces.milkAndHoney.rawValue,
                                            year: "Early 2000s"),
                             spec: binAndGittersSpec,
                             buildOrder: binAndGittersBuild ,
                             tags: binAndGittersTags,
                             variation: nil,
                             collection: .milkAndHoney,
                             titleCocktail: false)

let binAndGittersSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                                                  OldCocktailIngredient(.juices(.lime), value: 1),
                                                  OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                                                  OldCocktailIngredient(.gins(.ginAny), value: 2)]

let binAndGittersTags = Tags(profiles: [.refreshing, .light],
                             styles: [.sour, .shaken])


