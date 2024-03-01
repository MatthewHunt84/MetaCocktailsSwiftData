//
//  SecondSunrise.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation

var secondSunrise = Cocktail(cocktailName: "Second Sunrise",
                             imageAsset: nil,
                             glasswareType: .stemmedGlassware,
                             garnish: [.edibleFlower],
                             author:Author(person: AuthorNames.jamesMenkal.rawValue,
                                           place: AuthorPlaces.williamsAndGraham.rawValue, year: "2021"),
                             spec: secondSunriseSpec,
                             tags: secondSunriseTags,
                             collection: .williamsAndGraham)

let secondSunriseSpec: [CocktailIngredient] = [CocktailIngredient(.syrups(.cinnamonSyrup), value: 0.75),
                                               CocktailIngredient(.juices(.lemon), value: 0.75),
                                               CocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.25),
                                               CocktailIngredient(.fortifiedWines(.cocchiAmericano), value: 0.5),
                                               CocktailIngredient(.gins(.hendricks), value: 1.5),
                                               CocktailIngredient(.otherAlcohol(.lavenderTincture), value: 2, unit: .dashes)]


let secondSunriseTags = Tags(profiles: [.herbal, .refreshing, .floral, .light],
                      styles: [.sour, .shaken])
