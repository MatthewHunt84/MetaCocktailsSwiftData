//
//  Rosalita.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var rosalita = Cocktail(cocktailName: "Rosalita",
                        imageAsset: nil,
                        glasswareType: .collins,
                        garnish: [.rosePetals, .goldLeaf],
                        ice: .koldDraft,
                        author: Author(person: AuthorNames.kennyRemster.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue, year: "2020"),
                        spec: rosalitaSpec,
                        tags: rosalitaTags,
                        collection: .williamsAndGraham)

let rosalitaSpec = [CocktailIngredient(.soda(.feverTreeAromatic), value: 2),
                    CocktailIngredient(.amari(.ramazzottiRosato), value: 1),
                    CocktailIngredient(.gins(.leopoldAmericanSBGin), value: 1),
                    CocktailIngredient(.fortifiedWines(.cocchiRosa), value: 1)]


let rosalitaTags = Tags(profiles: [.fruity, .refreshing, .light],
                        styles: [.sour, .shaken])



