//
//  RamonaFlowers.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var ramonaFlowers = Cocktail(cocktailName: "Ramona Flowers",
                             imageAsset: nil,
                             glasswareType: .flute,
                             garnish: [.limePeel, .edibleFlower],
                             author:Author(person: AuthorNames.saydeeCanada.rawValue,
                                           place: AuthorPlaces.williamsAndGraham.rawValue),
                             spec: ramonaFlowersSpec,
                             tags: ramonaFlowersTags,
                             collection: .williamsAndGraham)

let ramonaFlowersSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.syrups(.simple), value: 0.5),
                                               OldCocktailIngredient(.juices(.lime), value: 0.5),
                                               OldCocktailIngredient(.liqueurs(.leopoldCherry), value: 0.25),
                                               OldCocktailIngredient(.gins(.leopoldNavy), value: 1.5),
                                               OldCocktailIngredient(.wines(.junmeiSake), value: 2)]


let ramonaFlowersTags = Tags(profiles: [.herbal, .refreshing, .floral, .light],
                             styles: [.sour, .shaken])
