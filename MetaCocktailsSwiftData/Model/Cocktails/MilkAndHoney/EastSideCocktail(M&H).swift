//
//  EastSideCocktail(M&H).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/14/24.
//

import Foundation

var eastSideCocktail = Cocktail(cocktailName: "East Side Cocktail",
                                imageAsset: nil,
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

let eastSideCocktailSpec: [CocktailIngredient] = [CocktailIngredient(.herbs(.mint), value: 10, unit: .gentlyMuddled),
                                                  CocktailIngredient(.fruit(.cucumberSlices), value: 2, unit: .muddled),
                                                  CocktailIngredient(.juices(.lime), value: 1),
                                                  CocktailIngredient(.syrups(.simple), value: 0.75),
                                                  CocktailIngredient(.gins(.ginAny), value: 2)]

let eastSideCocktailTags = Tags(profiles: [.herbal, .refreshing, .light],
                                styles: [.sour, .shaken])
