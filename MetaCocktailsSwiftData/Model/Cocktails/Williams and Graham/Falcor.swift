//
//  Falcor.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation


var falcoor = Cocktail(cocktailName: "Falcoooor!",
                       glasswareType: .martini,
                       garnish: [.cucumberSlices],
                       ice: nil,
                       author: Author(person: "Jesse Bowen", place: AuthorPlaces.williamsAndGraham.rawValue, year: "2018"),
                       spec: falcoorSpec,
                       tags: falcoorTags,
                       collection: .williamsAndGraham)

var falcoorSpec  = [OldCocktailIngredient(.fruit(.cucumberSlices), value: 2, unit: .muddled),
                    OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                    OldCocktailIngredient(.juices(.lime), value: 0.5),
                    OldCocktailIngredient(.syrups(.orgeat), value: 1, prep: PrepBible.orgeat),
                    OldCocktailIngredient(.amari(.amaroMontenegro), value: 0.5),
                    OldCocktailIngredient(.bitters(.orangeBitters), value: 0.5),
                    OldCocktailIngredient(.rums(.smithAndCross), value: 0.75)]

var falcoorTags = Tags(profiles: [.refreshing, .fruity, .bright, .complex],
                       styles: [.sour, .shaken])
