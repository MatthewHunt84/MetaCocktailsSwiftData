////
////  Mojito.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////

import SwiftUI

var mojito = Cocktail(cocktailName: "Mojito",
                      glasswareType: .collins,
                      garnish: [.mintBouquet],
                      ice: .koldDraft,
                      author: Author(person: "Cuba" ,year: "1800s"),
                      spec: mojitoSpec,
                      buildOrder: mojitoBuild,
                      notes: mojitoNote,
                      tags: mojitoTags,
                      variation: .mojito,
                      titleCocktail: true)

let mojitoSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.herbs(.mint), value: 8, unit: .gentlyMuddled),
                                           OldCocktailIngredient(.juices(.lime), value: 1),
                                           OldCocktailIngredient(.syrups(.simple), value: 1, prep: PrepBible.simpleSyrupPrep),
                                           OldCocktailIngredient(.rums(.rumWhite), value: 1.5),
                                           OldCocktailIngredient(.soda(.sparklingWater), value: 2)]

let mojitoTags = Tags(profiles: [.herbal, .refreshing, .light, .effervescent],
                      styles: [.fizz, .shaken, .built])

