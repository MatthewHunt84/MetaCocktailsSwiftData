//
//  StrawberryFix.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var strawberryFix = Cocktail(cocktailName: "Strawberry Fix",
                             glasswareType: .doubleOld,
                             garnish: [.strawberryWhole],
                             ice: .pebbleIce,
                             author: Author(person: AuthorNames.sashaPetraske.rawValue,
                                            place: AuthorPlaces.milkAndHoney.rawValue,
                                            year: "Early 2000s"),
                             spec: queensParkLightMnHSpec,
                             buildOrder: queensParkLightMnHBuild,
                             tags: queensParkLightMnHTags,
                             variation: nil,
                             collection: .milkAndHoney,
                             titleCocktail: false)

var strawberryFixSpec = [OldCocktailIngredient(.fruit(.strawberryHalf), value: 4,  unit: .gentlyMuddled),
                         OldCocktailIngredient(.juices(.lemon), value: 0.75),
                         OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                         OldCocktailIngredient(.whiskies(.bourbonAny), value: 2)]

var strawberryFixTags = Tags(profiles: [.fruity, .refreshing, .citrusy, .light],
                             styles: [.shaken, .sour])


