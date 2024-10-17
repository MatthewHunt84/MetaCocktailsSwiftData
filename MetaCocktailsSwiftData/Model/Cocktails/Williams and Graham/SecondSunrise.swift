//
//  SecondSunrise.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation

var secondSunrise = Cocktail(cocktailName: "Second Sunrise",
                             glasswareType: .stemmedGlassware,
                             garnish: [.edibleFlower],
                             author:Author(person: AuthorNames.jamesMenkal.rawValue,
                                           place: AuthorPlaces.williamsAndGraham.rawValue, year: "2021"),
                             spec: secondSunriseSpec,
                             tags: secondSunriseTags,
                             collection: .williamsAndGraham)

let secondSunriseSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.syrups(.cinnamonSyrup), value: 0.75, prep: PrepBible.cinnamonSyrup),
                                                  OldCocktailIngredient(.juices(.lemon), value: 0.75),
                                                  OldCocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.25),
                                                  OldCocktailIngredient(.fortifiedWines(.cocchiAmericano), value: 0.5),
                                                  OldCocktailIngredient(.gins(.hendricks), value: 1.5),
                                                  OldCocktailIngredient(.otherAlcohol(.lavenderTincture), value: 2, unit: .dashes, prep: PrepBible.lavenderTincture)]


let secondSunriseTags = Tags(profiles: [.herbal, .refreshing, .floral, .light],
                             styles: [.sour, .shaken])
