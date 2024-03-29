////
////  MaiTai.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////

import SwiftUI

var maiTai  = Cocktail(cocktailName: "Mai Tai",
                       glasswareType: .doubleOld,
                       garnish: [.mintBouquet, .spentLimeShell],
                       ice: .pebbleIce,
                       author:Author(person: AuthorNames.traderVic.rawValue,
                                     year: "1944"),
                       spec: maiTaiSpec,
                       tags: maiTaiTags,
                       variation: .maiTai,
                       collection: .originals,
                       titleCocktail: true)

var maiTaiSpec    = [CocktailIngredient(.juices(.lime), value: 1),
                     CocktailIngredient(.syrups(.richDem), value: 1, unit: .teaspoon, prep: PrepBible.richDem),
                     CocktailIngredient(.syrups(.orgeat), value: 0.25, prep: PrepBible.orgeat),
                     CocktailIngredient(.liqueurs(.orangeCuracao), value: 0.25),
                     CocktailIngredient(.rums(.wrayAndNephew17), value: 2)]

var maiTaiTags     = Tags(profiles: [.fruity, .refreshing, .citrusy], 
                          styles: [.sour, .shaken])
                          

