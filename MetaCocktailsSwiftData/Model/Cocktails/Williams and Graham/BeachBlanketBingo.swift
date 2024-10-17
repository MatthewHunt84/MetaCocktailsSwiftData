//
//  BeachBlanketBingo.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var beachBlanketBingo = Cocktail(cocktailName: "Beach Blanket Bingo",
                                 glasswareType: .collins,
                                 garnish: [.raspberry],
                                 ice: .koldDraft,
                                 author: Author(person: AuthorNames.christinaAndrews.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue),
                                 spec: beachBlanketBingoSpec,
                                 tags: beachBlanketBingoTags,
                                 collection: .williamsAndGraham)

let beachBlanketBingoSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.wines(.prosecco), value: 2),
                                                   OldCocktailIngredient(.fruit(.raspberries), value: 2, unit: .muddled),
                                                   OldCocktailIngredient(.juices(.lemon), value: 0.5),
                                                   OldCocktailIngredient(.syrups(.honeySyrup), value: 0.5, prep: PrepBible.honeySyrup),
                                                   OldCocktailIngredient(.liqueurs(.giffardPamplemousse), value: 0.5),
                                                   OldCocktailIngredient(.rums(.plantationPineapple), value: 1),
                                                   OldCocktailIngredient(.liqueurs(.anchoRayesAncho), value: 1.5)]


let beachBlanketBingoTags = Tags(profiles: [.refreshing, .spicy, .fruity],
                                 styles: [.sour, .shaken, .fizz])

