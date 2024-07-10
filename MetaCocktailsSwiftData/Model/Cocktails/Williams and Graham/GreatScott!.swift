//
//  GreatScott!.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var greatScott = Cocktail(cocktailName: "Great Scott!",
                          glasswareType: .collins,
                          garnish: [.lemonWheel, .basilSprig],
                          ice: nil,
                          author: Author(person: "Whitney Allen", place: AuthorPlaces.williamsAndGraham.rawValue, year: "2018"),
                          spec: greatScottSpec,
                          tags: greatScottTags,
                          collection: .williamsAndGraham)

var greatScottSpec  = [OldCocktailIngredient(.soda(.lemonMintSoda), value: 2),
                       OldCocktailIngredient(.juices(.lemon), value: 0.5),
                       OldCocktailIngredient(.amari(.cardamaro), value: 0.5),
                       OldCocktailIngredient(.whiskies(.monkeyShoulder), value: 1.5)]

var greatScottTags = Tags(profiles: [.refreshing, .herbal, .bright],
                          styles: [.fizz, .shaken])

