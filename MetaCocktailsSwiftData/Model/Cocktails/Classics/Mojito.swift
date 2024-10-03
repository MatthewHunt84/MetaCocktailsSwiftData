////
////  Mojito.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////

import SwiftUI

var mojito = Cocktail(cocktailName: "Mojito",
                      imageAsset: nil,
                      glasswareType: .collins,
                      garnish: [.mintBouquet],
                      ice: .koldDraft,
                      author: Author(person: "Cuba" ,year: "1800s"),
                      spec: mojitoSpec,
                      buildOrder: mojitoBuild,
                      notes: mojitoNotes,
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

let mojitoBuild =  Build(instructions: [Instruction(step: 1, method: "Shake all of the ingredients except for the soda in a tin. Use Kold draft of Hoshizake cubes and the mint will the muddled while you're shaking. If you're using smaller cubes, give the mint a gentle muddle first."),
                                        Instruction(step: 2, method: "Add the ice then soda to the glass. Try not to pour the soda directly over the ice."),
                                        Instruction(step: 3, method: "Double strain the shaken cocktail over the soda and ice."),
                                        Instruction(step: 4, method: "Garnish with a mint bouquet. Serve with a straw.")])
