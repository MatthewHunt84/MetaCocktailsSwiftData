//
//  Gabriella.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/11/24.
//

import Foundation


var gabriella = Cocktail(cocktailName: "Gabriella",
                             glasswareType: .doubleOld,
                             garnish: [.cucumberSlices],
                             ice: .koldDraft,
                             author:Author(person: AuthorNames.sashaPetraske.rawValue ,place: AuthorPlaces.milkAndHoney.rawValue , year: "Early 2000s"),
                             spec: gabriellaSpec,
                             buildOrder: nil,
                             tags: gabriellaTags,
                             collection: .milkAndHoney)

var gabriellaSpec     =  [CocktailIngredient(.fruit(.cucumberSlices), value: 3, unit: .muddled),
                              CocktailIngredient(.herbs(.mint), value: 2, unit: .gentlyMuddled),
                              CocktailIngredient(.juices(.lime), value: 0.75),
                              CocktailIngredient(.seasoning(.mineralSaline), value: 0.75, prep: PrepBible.mineralSaline),
                              CocktailIngredient(.agaves(.tapatioTequilaBlanco), value: 2)]

var gabriellaTags     = Tags(profiles: [.light, .refreshing, .citrusy, .tart],
                                 styles: [.sour, .shaken])
