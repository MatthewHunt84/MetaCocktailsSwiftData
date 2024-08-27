//
//  PainKiller.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var painKiller  = Cocktail(cocktailName: "Pain Killer",
                           glasswareType: .collins,
                           garnish: [.nutmeg],
                           ice: .crackedIce,
                           author: Author(person: "Daphne Henderson", place: "Soggy Dollar Bar. White Bay, Jost Van Dyke", year: "1970s"),
                           spec: painKillerSpec,
                           tags: painKillerTags,
                           variation: .painKiller,
                           collection: .originals,
                           titleCocktail: true)

var painKillerSpec  = [OldCocktailIngredient(.juices(.orange), value: 0.5),
                       OldCocktailIngredient(.syrups(.cocoLopez), value: 0.75),
                       OldCocktailIngredient(.juices(.pineappleJuice), value: 1.5),
                       OldCocktailIngredient(.rums(.pussersRum) , value: 1.5)]


var painKillerTags   = Tags(flavors: [.nutmeg],
                            profiles: [.fruity, .sweet, .tropical, .refreshing],
                            styles: [.swizzle, .tiki, .sour])

