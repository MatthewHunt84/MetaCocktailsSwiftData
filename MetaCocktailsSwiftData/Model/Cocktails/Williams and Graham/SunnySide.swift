//
//  SunnySide.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/15/24.
//

import Foundation


var sunnySide = Cocktail(cocktailName: "Sunny Side",
                         glasswareType: .doubleOld,
                         garnish: [.mintBouquet],
                         ice: .bigRock,
                         author:Author(person: AuthorNames.jamesMenkal.rawValue,
                                       place: AuthorPlaces.williamsAndGraham.rawValue),
                         spec: sunnySideSpec,
                         buildOrder: sunnySideBuild,
                         tags: sunnySideTags,
                         variation: .southSide,
                         collection: .williamsAndGraham)

let sunnySideSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.otherAlcohol(.absinthe), value: 2, unit: .sprays),
                                              OldCocktailIngredient(.herbs(.mint), value: 8, unit: .gentlyMuddled),
                                              OldCocktailIngredient(.juices(.lime), value: 0.75),
                                              OldCocktailIngredient(.syrups(.cucumberSyrup), value: 0.5, prep: PrepBible.cucumberSyrup),
                                              OldCocktailIngredient(.syrups(.gingerSyrup), value: 0.25, prep: PrepBible.gingerSyrup),
                                              OldCocktailIngredient(.fortifiedWines(.cocchiAmericano), value: 0.5),
                                              OldCocktailIngredient(.gins(.ginAny), value: 1.5)]


let sunnySideTags = Tags(profiles: [.herbal, .refreshing, .light, .restorative],
                         styles: [.sour, .shaken])

