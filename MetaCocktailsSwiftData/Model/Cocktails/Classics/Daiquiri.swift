////
////  Daiquiri.swift
////  MetaCocktails
////
////  Created by Matt Hunt on 9/1/23.
////

import Foundation

let daiquiri = Cocktail(cocktailName: "Daiquiri",
                        glasswareType: .coupe,
                        garnish: [.limeWheel],
                        author: Author(place: "Cuba", year: "1890s"),
                        spec: daiquiriSpec,
                        tags: daiquiriTags,
                        variation: .daiquiri,
                        titleCocktail: true)

var daiquiriSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.rums(.rumWhite), value: 2.0),
                                             OldCocktailIngredient(.juices(.lime), value: 0.75),
                                             OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep)]

var daiquiriTags = Tags(profiles: [.citrusy, .refreshing, .light],
                        styles: [.sour, .shaken])

var daiquiriNotes = "This is the perfect cocktail. It's the king of the Cuban cocktails. It's a cocktail thats sweetened with the base material of the ditilate and complimented with lime. It's perfection in simplicity. Everyone has their version. On the east coast, you'll see the lime in larger proportion than the simple. This is how we like it the most. Just do yourself a favor and use a well distilled rum like Planteray 3 star or Banks 5 Island."
