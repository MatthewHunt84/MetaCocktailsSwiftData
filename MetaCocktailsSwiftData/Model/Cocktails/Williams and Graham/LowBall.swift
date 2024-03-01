//
//  LowBall.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var lowBall  =  Cocktail(cocktailName: "Low Ball",
                         glasswareType: .doubleOld,
                         garnish: [.orangeExpress],
                         ice: .bigRock,
                         author:Author(person: AuthorNames.jamesMenkal.rawValue,
                                       place: AuthorPlaces.williamsAndGraham.rawValue,
                                       year: "2020"),
                         spec: lowBallSpec,
                         buildOrder: nil,
                         tags: lowBallTags,
                         collection: .williamsAndGraham)

var lowBallSpec = [CocktailIngredient(.agaves(.tanteoJalepeno), value: 0.25, unit: .dashes),
                   CocktailIngredient(.amari(.suze), value: 0.5),
                   CocktailIngredient(.fortifiedWines(.cocchiAmericano), value: 0.75),
                   CocktailIngredient(.whiskies(.toki), value: 1.5)]

var lowBallTags = Tags(profiles: [.spiritForward, .herbal, .punchy, .vegetal],
                       styles: [.manhattan, .stirred])
