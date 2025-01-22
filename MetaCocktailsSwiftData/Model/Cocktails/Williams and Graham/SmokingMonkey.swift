//
//  SmokingMonkey.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation


var smokingMonkey = Cocktail(cocktailName: "Smoking Monkey",
                             glasswareType: .stemmedGlassware,
                             garnish: [.angoAndPeychaudsDeco],
                             author:Author(person: AuthorNames.jamesMenkal.rawValue,
                                           place: AuthorPlaces.williamsAndGraham.rawValue, year: "2018"),
                             spec: smokingMonkeySpec,
                             buildOrder: smokingMonkeyBuild,
                             notes: smokingMonkeyNote,
                             tags: smokingMonkeyTags,
                             collection: .williamsAndGraham)

let smokingMonkeySpec: [OldCocktailIngredient] = [OldCocktailIngredient(.syrups(.gingerSyrup), value: 0.25, prep: PrepBible.gingerSyrup),
                                                  OldCocktailIngredient(.juices(.lemon), value: 0.5),
                                                  OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                                                  OldCocktailIngredient(.liqueurs(.velvetFalernum), value: 0.25),
                                                  OldCocktailIngredient(.liqueurs(.strega), value: 0.5),
                                                  OldCocktailIngredient(.whiskies(.ardbeg), value: 0.5),
                                                  OldCocktailIngredient(.gins(.monkey47), value: 1)]


let smokingMonkeyTags = Tags(profiles: [.herbal, .refreshing, .complex, .silky],
                             styles: [.sour, .shaken])


