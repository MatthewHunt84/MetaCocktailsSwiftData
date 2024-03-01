//
//  AlloeForThatBurn.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation

var aloeForThatBurn = Cocktail(cocktailName: "Aloe for that Burn",
                         imageAsset: nil,
                         glasswareType: .stemmedGlassware,
                         garnish: [.limeWheel],
                         author: Author(person: "Killian Hopkins", place: AuthorPlaces.williamsAndGraham.rawValue, year: "2018"),
                         spec: aloeForThatBurnSpec,
                         tags: aloeForThatBurnTags,
                               collection: .williamsAndGraham)

let aloeForThatBurnSpec: [CocktailIngredient] = [CocktailIngredient(.otherAlcohol(.jalapeñoTincture), value: 5, unit: .dashes),
                                                 CocktailIngredient(.juices(.lime), value: 0.5),
                                                 CocktailIngredient(.syrups(.cucumberSyrup), value: 0.5, prep: PrepBible.cucumberSyrup),
                                                 CocktailIngredient(.liqueurs(.charaeu), value: 0.75),
                                                 CocktailIngredient(.vodkas(.stGeorgeGreenChileVodka), value: 0.75),
                                                 CocktailIngredient(.agaves(.tequilaOchoBlanco), value: 1.25)]


let aloeForThatBurnTags = Tags(profiles: [.spicy, .refreshing, .citrusy, .light],
                               styles: [.sour, .shaken])

