////
////  MaiTai.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////

import SwiftUI

var maiTai  = Cocktail(cocktailName: "Mai Tai",
                       glasswareType: .doubleOld,
                       garnish: [.mintBouquet, .orchid],
                       ice: .pebbleIce,
                       author:Author(person: AuthorNames.traderVic.rawValue,
                                     year: "1944"),
                       spec: maiTaiSpec,
                       tags: maiTaiTags)

var maiTaiSpec    = [CocktailIngredient(.juices(.lime), value: 1),
                     CocktailIngredient(.syrups(.richDem), value: 1, unit: .teaspoon),
                     CocktailIngredient(.syrups(.orgeat), value: 0.25),
                     CocktailIngredient(.liqueurs(.orangeCuracao), value: 0.5),
                     CocktailIngredient(.rums(.rumAged), value: 2.25)]

var maiTaiTags     = Tags(profiles: [.fruity, .refreshing, .citrusy], 
                          styles: [.sour, .shaken])
                          

