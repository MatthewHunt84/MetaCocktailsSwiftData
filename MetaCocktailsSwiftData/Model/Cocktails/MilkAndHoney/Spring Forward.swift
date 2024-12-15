//
//  Spring Forward.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/29/24.
//

import Foundation

var springForward = Cocktail(cocktailName: "Spring Forward",
                             glasswareType: .coupe,
                             garnish: [.springOnions],
                             ice: nil,
                             author:Author(person: AuthorNames.sashaPetraske.rawValue ,  place: AuthorPlaces.johnDoryOysterBar.rawValue , year: "Early 2000s"),
                             spec: springForwardSpec,
                             buildOrder: springForwardBuild,
                             tags: springForwardTags,
                             collection: .milkAndHoney)

var springForwardSpec     =  [OldCocktailIngredient(.fortifiedWines(.dolinDry), value: 1),
                              OldCocktailIngredient(.gins(.ginAny), value: 2),
                              OldCocktailIngredient(.otherNonAlc(.springOnion), value: 1, unit: .gentlyMuddled)]

var springForwardTags     = Tags(profiles: [.spiritForward, .dry, .vegetal],
                                 styles: [.martini, .stirred])


