//
//  FrescaPlatino.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/11/24.
//

import Foundation

var frescaPlatino = Cocktail(cocktailName: "Fresca Platino",
                             glasswareType: .doubleOld,
                             garnish: [.cucumberSlices],
                             ice: .koldDraft,
                             author:Author(person: AuthorNames.sashaPetraske.rawValue ,place: AuthorPlaces.milkAndHoney.rawValue , year: "Early 2000s"),
                             spec: frescaPlatinoSpec,
                             buildOrder: nil,
                             tags: frescaPlatinoTags,
                             collection: .milkAndHoney)

var frescaPlatinoSpec     =  [OldCocktailIngredient(.fruit(.cucumberSlices), value: 3, unit: .muddled),
                              OldCocktailIngredient(.herbs(.mint), value: 2, unit: .gentlyMuddled),
                              OldCocktailIngredient(.juices(.lime), value: 0.75),
                              OldCocktailIngredient(.seasoning(.mineralSaline), value: 0.75, prep: PrepBible.mineralSaline),
                              OldCocktailIngredient(.agaves(.tapatioTequilaBlanco), value: 2)]

var frescaPlatinoTags     = Tags(profiles: [.light, .refreshing, .citrusy, .tart],
                                 styles: [.sour, .shaken])
