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
                        spec: daiquiriSpec,
                        tags: daiquiriTags,
                        variation: .daiquiri,
                        collection: .originals,
                        titleCocktail: true)

var daiquiriSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.rums(.rumWhite), value: 2.0),
                                          OldCocktailIngredient(.juices(.lime), value: 0.75),
                                          OldCocktailIngredient(.syrups(.simple), value: 0.75)]

var daiquiriTags = Tags(profiles: [.citrusy, .refreshing, .light],
                        styles: [.sour, .shaken])
              
