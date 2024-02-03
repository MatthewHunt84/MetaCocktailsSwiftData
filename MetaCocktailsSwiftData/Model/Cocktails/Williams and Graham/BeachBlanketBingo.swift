//
//  BeachBlanketBingo.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var beachBlanketBingo = Cocktail(cocktailName: "Beach Blanket Bingo",
                                 imageAsset: nil,
                                 glasswareType: .collins,
                                 garnish: [.raspberry],
                                 ice: .koldDraft,
                                 author: Author(place: AuthorPlaces.williamsAndGraham.rawValue),
                                 spec: beachBlanketBingoSpec,
                                 tags: beachBlanketBingoTags)

let beachBlanketBingoSpec: [CocktailIngredient] = [CocktailIngredient(.wines(.prosecco), value: 2),
                                                   CocktailIngredient(.fruit(.raspberries), value: 2, unit: .muddled),
                                                   CocktailIngredient(.juices(.lemon), value: 0.5),
                                                   CocktailIngredient(.syrups(.honeySyrup), value: 0.5),
                                                   CocktailIngredient(.liqueurs(.giffardPamplemousse), value: 0.5),
                                                   CocktailIngredient(.rums(.plantationPineapple), value: 1),
                                                   CocktailIngredient(.liqueurs(.anchoRayesAncho), value: 1.5)]


let beachBlanketBingoTags = Tags(profiles: [.refreshing, .spicy, .fruity],
                                 styles: [.sour, .shaken, .fizz])

