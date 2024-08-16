//
//  AppleJack(M&H).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/29/24.
//

import Foundation

var appleJackMnH = Cocktail(cocktailName: "Apple Jack (Milk & Honey)",
                            glasswareType: .coupe,
                            garnish: nil,
                            ice: nil,
                            author:Author(person: AuthorNames.sashaPetraske.rawValue ,  place: AuthorPlaces.milkAndHoney.rawValue , year: "Early 2000s"),
                            spec: appleJackMnHSpec,
                            buildOrder: nil,
                            tags: appleJackMnHTags,
                            variation: .appleJackCocktail,
                            collection: .milkAndHoney)

var appleJackMnHSpec     =  [OldCocktailIngredient(.juices(.lemon), value: 0.5),
                             OldCocktailIngredient(.syrups(.simple), value: 0.5, prep: PrepBible.simpleSyrupPrep),
                             OldCocktailIngredient(.juices(.appleCider), value: 0.5),
                             OldCocktailIngredient(.brandies(.lairdsApplejack), value: 1.5)]

var appleJackMnHTags     = Tags(profiles: [.fruity, .refreshing, .citrusy],
                                styles: [.sour, .shaken])
