//
//  BanhMi.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var banhMi  =  Cocktail(cocktailName: "Banh Mi",
                        glasswareType: .doubleOldAsparagusSaltRim,
                        garnish: [.mintSprig],
                        ice: .bigRock,
                        author:Author(person: AuthorNames.jamesMenkal.rawValue,
                                      place: AuthorPlaces.williamsAndGraham.rawValue, year: "2019"),
                        spec: banhMiSpec,
                        buildOrder: nil,
                        tags: banhMiTags,
                        collection: .williamsAndGraham)

var banhMiSpec = [OldCocktailIngredient(.herbs(.mint), value: 5, unit: .gentlyMuddled),
                  OldCocktailIngredient(.herbs(.cilantro), value: 5, unit: .gentlyMuddled),
                  OldCocktailIngredient(.juices(.lime), value: 0.75),
                  OldCocktailIngredient(.syrups(.cucumberSyrup), value: 0.75, prep: PrepBible.cucumberSyrup),
                  OldCocktailIngredient(.juices(.carrotJuice), value: 0.5),
                  OldCocktailIngredient(.rums(.plantation3Star), value: 1),
                  OldCocktailIngredient(.otherAlcohol(.bataviaArrack), value: 1)]

var banhMiTags = Tags(profiles: [.savory, .refreshing, .funky, .restorative],
                      styles: [.sour, .shaken])
