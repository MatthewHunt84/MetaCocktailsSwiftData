//
//  TequilaEastSide.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/14/24.
//

import Foundation


var tequilaEastSide = Cocktail(cocktailName: "Tequila East Side",
                               glasswareType: .doubleOld,
                               garnish: nil,
                               ice: .bigRock,
                               author: Author(person: AuthorNames.christiPope.rawValue ,
                                              place: AuthorPlaces.milkAndHoney.rawValue,
                                              year: "Early 2000s"),
                               spec: tequilaEastSideSpec,
                               buildOrder: nil ,
                               tags: tequilaEastSideTags,
                               variation: .eastSide,
                               collection: .milkAndHoney,
                               titleCocktail: false)

let tequilaEastSideSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.herbs(.mint), value: 10, unit: .gentlyMuddled),
                                                 OldCocktailIngredient(.fruit(.cucumberSlices), value: 2, unit: .muddled),
                                                 OldCocktailIngredient(.juices(.lime), value: 1),
                                                 OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                                                 OldCocktailIngredient(.agaves(.tequilaBlanco), value: 1.5)]

let tequilaEastSideTags = Tags(profiles: [.herbal, .refreshing, .light],
                               styles: [.sour, .shaken])
