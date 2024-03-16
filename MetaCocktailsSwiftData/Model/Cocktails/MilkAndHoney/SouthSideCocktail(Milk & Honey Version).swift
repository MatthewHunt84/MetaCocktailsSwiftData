//
//  SouthSideCocktail(Milk & Honey Version).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/14/24.
//

import Foundation

var southSideCocktail = Cocktail(cocktailName: "South Side Cocktail(Milk & Honey Version)",
                                 imageAsset: nil,
                                 glasswareType: .coupe,
                                 garnish: [.mintLeaf],
                                 ice: nil,
                                 author: Author(person: nil , place: AuthorPlaces.milkAndHoney.rawValue, year: "Early 2000s"),
                                 spec: southSideCocktailSpec,
                                 buildOrder: nil ,
                                 tags: southSideCocktailTags,
                                 variation: .southSide,
                                 collection: .milkAndHoney,
                                 titleCocktail: false)

let southSideCocktailSpec: [CocktailIngredient] = [CocktailIngredient(.herbs(.mint), value: 10, unit: .gentlyMuddled),
                                                   CocktailIngredient(.juices(.lime), value: 1),
                                                   CocktailIngredient(.syrups(.simple), value: 0.75),
                                                   CocktailIngredient(.gins(.ginAny), value: 1.5)]

let southSideCocktailTags = Tags(profiles: [.herbal, .refreshing, .light],
                                 styles: [.sour, .shaken])
