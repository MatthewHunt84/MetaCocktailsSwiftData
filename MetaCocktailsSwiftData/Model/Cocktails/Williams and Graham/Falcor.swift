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
                       tags: falcoorTags)

var falcoorSpec  = [CocktailIngredient(.fruit(.cucumberSlices), value: 2, unit: .muddled),
                    CocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                    CocktailIngredient(.juices(.lime), value: 0.5),
                    CocktailIngredient(.syrups(.orgeat), value: 1, prep: PrepBible.orgeat),
                    CocktailIngredient(.amari(.amaroMontenegro), value: 0.5),
                    CocktailIngredient(.bitters(.orangeBitters), value: 0.5),
                    CocktailIngredient(.rums(.smithAndCross), value: 0.75)]

var falcoorTags = Tags(profiles: [.refreshing, .fruity, .bright, .complex],
                       styles: [.sour, .shaken])
