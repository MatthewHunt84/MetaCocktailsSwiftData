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

var daiquiriNotes = "This is the king of the Cuban cocktails. While the preferred balance of citrus and and sweet varies between bartenders, a high quality white rum is essential. We recommend Planteray 3 star or Banks 5 Island."
