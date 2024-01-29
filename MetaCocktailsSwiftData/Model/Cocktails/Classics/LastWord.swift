////
////  LastWord.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////

import SwiftUI

var lastWord = Cocktail(cocktailName: "Last Word",
                        glasswareType: .stemmedGlassware,
                        ice: nil,
                        author: Author(person: "Frank Fogarty", place: AuthorPlaces.detroitAthleticClub.rawValue),
                        spec: lastWordSpec,
                        buildOrder: nil,
                        tags: lastWordTags)

var lastWordSpec  = [CocktailIngredient(.juices(.lime), value: 0.75),
                     CocktailIngredient(.gins(.ginLondonDry), value: 0.75),
                     CocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.75),
                     CocktailIngredient(.liqueurs(.greenChartreuse), value: 0.75)]

var lastWordTags = Tags(textures: [.light],
                        styles: [.sour, .shaken],
                        booze: [Booze(.gins(.ginAny))])
                    
