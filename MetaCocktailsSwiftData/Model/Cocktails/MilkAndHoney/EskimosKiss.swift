//
//  EskimosKiss.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation


var eskimosKiss = Cocktail(cocktailName: "Eskimo's Kiss",
                           glasswareType: .hurricaneGlass,
                           garnish: [.mintBouquet],
                           ice: .pebbleIce,
                           author: Author(person: AuthorNames.sashaPetraske.rawValue,
                                          place: AuthorPlaces.milkAndHoney.rawValue,
                                          year: "2004"),
                           spec: eskimosKissSpec,
                           buildOrder: eskimosKissBuild,
                           tags: eskimosKissTags,
                           variation: nil,
                           collection: .milkAndHoney,
                           titleCocktail: true)

let eskimosKissSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.otherNonAlc(.demeraraSugarCube), value: 2, unit: .muddled),
                                             OldCocktailIngredient(.herbs(.mint), value: 12, unit: .gentlyMuddled),
                                             OldCocktailIngredient(.juices(.lime), value: 2),
                                             OldCocktailIngredient(.syrups(.simple), value: 1.5, prep: PrepBible.simpleSyrupPrep),
                                             OldCocktailIngredient(.rums(.rumWhite), value: 4)]

let eskimosKissTags = Tags(profiles: [.herbal, .refreshing, .light, .effervescent],
                           styles: [.fizz, .shaken])




