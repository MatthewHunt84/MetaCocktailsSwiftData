//
//  RayonVert.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation

var reyonVert = Cocktail(cocktailName: "Rayon Vert",
                         glasswareType: .doubleOld,
                         garnish: [.basilSprig],
                         ice: .bigRock,
                         author:Author(person: AuthorNames.jamesMenkal.rawValue,
                                       place: AuthorPlaces.williamsAndGraham.rawValue,
                                       year: "2018"),
                         spec: reyonVertSpec,
                         buildOrder: reyonVertBuild,
                         tags: reyonVertTags,
                         collection: .williamsAndGraham)

let reyonVertSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.herbs(.basil), value: 7, unit: .nitroMuddled),
                                           OldCocktailIngredient(.juices(.lime), value: 0.5),
                                           OldCocktailIngredient(.syrups(.cucumberSyrup), value: 0.5, prep: PrepBible.cucumberSyrup),
                                           OldCocktailIngredient(.gins(.junipero), value: 2),
                                           OldCocktailIngredient(.otherAlcohol(.absinthe), value: 5, unit: .sprays)]
                                        

let reyonVertTags = Tags(profiles: [.herbal, .refreshing, .light, .restorative],
                      styles: [.sour, .shaken])

