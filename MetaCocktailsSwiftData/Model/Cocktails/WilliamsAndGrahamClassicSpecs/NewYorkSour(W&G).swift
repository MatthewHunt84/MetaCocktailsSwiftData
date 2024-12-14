//
//  NewYorkSour(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var NewYorkSourWnG = Cocktail(cocktailName: "New York Sour" + wAndGTitleTag,
                              glasswareType: .stemmedGlassware,
                              garnish: nil,
                              ice: nil,
                              author: williamsAndGraham,
                              spec: NewYorkSourSpecWnG,
                              buildOrder: NewYorkSourBuildWnG,
                              tags: NewYorkSourTagsWnG,
                              variation: .newYorkSour,
                              collection: .williamsAndGraham)

var NewYorkSourSpecWnG = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                          OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                          OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                          OldCocktailIngredient(.whiskies(.fourRosesYellowLabel), value: 1.5),
                          OldCocktailIngredient(.wines(.dryRedWine), value: 0.5)]

var NewYorkSourTagsWnG = Tags(profiles: [.citrusy, .light, .refreshing, .silky],
                              styles: [.sour, .shaken])

