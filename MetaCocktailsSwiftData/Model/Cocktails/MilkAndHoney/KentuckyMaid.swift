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



