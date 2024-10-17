//
//  EastSideCocktail(M&H).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/14/24.
//

import Foundation

var eastSideCocktail = Cocktail(cocktailName: "East Side Cocktail",
                                glasswareType: .coupe,
                                garnish: [.cucumberSlices],
                                ice: nil,
                                author: Author(person: AuthorNames.christiPope.rawValue ,
                                               place: AuthorPlaces.milkAndHoney.rawValue,
                                               year: "Early 2000s"),
                                spec: eastSideCocktailSpec,
                                buildOrder: nil ,
                                tags: eastSideCocktailTags,
                                variation: .eastSide,
                                collection: .milkAndHoney,
                                titleCocktail: false)

let eastSideCocktailSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.herbs(.mint), value: 10, unit: .gentlyMuddled),
                                                  OldCocktailIngredient(.fruit(.cucumberSlices), value: 2, unit: .muddled),
                                                  OldCocktailIngredient(.juices(.lime), value: 1),
                                                  OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                                                  OldCocktailIngredient(.gins(.ginAny), value: 2)]

let eastSideCocktailTags = Tags(profiles: [.herbal, .refreshing, .light],
                                styles: [.sour, .shaken])
