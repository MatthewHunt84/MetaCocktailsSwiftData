//
//  TequilaEastSide.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/14/24.
//

import Foundation


var tequilaEastSide = Cocktail(cocktailName: "Tequila East Side",
                               imageAsset: nil,
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

let tequilaEastSideSpec: [CocktailIngredient] = [CocktailIngredient(.herbs(.mint), value: 10, unit: .gentlyMuddled),
                                                 CocktailIngredient(.fruit(.cucumberSlices), value: 2, unit: .muddled),
                                                 CocktailIngredient(.juices(.lime), value: 1),
                                                 CocktailIngredient(.syrups(.simple), value: 0.75),
                                                 CocktailIngredient(.agaves(.tequilaBlanco), value: 1.5)]

let tequilaEastSideTags = Tags(profiles: [.herbal, .refreshing, .light],
                               styles: [.sour, .shaken])
