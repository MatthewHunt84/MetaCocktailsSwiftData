//
//  KentuckyMaid.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var kentuckyMaid = Cocktail(cocktailName: "Kentucky Maid",
                            glasswareType: .doubleOld,
                            garnish: [.mintSprig, .cucumberSlices],
                            ice: .bigRock,
                            author: Author(person: AuthorNames.samRoss.rawValue,
                                           place: AuthorPlaces.milkAndHoney.rawValue,
                                           year: "2005"),
                            spec: kentuckyMaidSpec,
                            buildOrder: kentuckyMaidBuild,
                            tags: kentuckyMaidTags,
                            variation: .kentuckyMaid,
                            collection: .milkAndHoney,
                            titleCocktail: true)

let kentuckyMaidSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.herbs(.mint), value: 8, unit: .gentlyMuddled),
                                                 OldCocktailIngredient(.fruit(.cucumberSlices), value: 2, unit: .gentlyMuddled),
                                                 OldCocktailIngredient(.juices(.lime), value: 1),
                                                 OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                                                 OldCocktailIngredient(.whiskies(.elijahCraigSmallBatch), value: 2)]

let kentuckyMaidTags = Tags(profiles: [.herbal, .refreshing, .light, .restorative],
                            styles: [.sour, .shaken])

let kentuckyMaidBuild =  Build(instructions: [Instruction(step: 1, method: "Gently muddle the cucumber, lime, and simple together."),
                                              Instruction(step: 2, method: "Add the rest of the ingredients and shake with ice."),
                                              Instruction(step: 3, method: "Double strain over a large cube."),
                                              Instruction(step: 4, method: "Garnish with a mint sprig skewered through a cucumber slice.")])

