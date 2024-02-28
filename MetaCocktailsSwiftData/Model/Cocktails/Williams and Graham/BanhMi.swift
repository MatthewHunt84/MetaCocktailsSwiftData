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
                        tags: banhMiTags)

var banhMiSpec = [CocktailIngredient(.herbs(.mint), value: 5, unit: .gentlyMuddled),
                  CocktailIngredient(.herbs(.cilantro), value: 5, unit: .gentlyMuddled),
                  CocktailIngredient(.juices(.lime), value: 0.75),
                  CocktailIngredient(.syrups(.cucumberSyrup), value: 0.75, prep: PrepBibleViewModel().cucumberSyrup),
                  CocktailIngredient(.juices(.carrotJuice), value: 0.5),
                  CocktailIngredient(.rums(.plantation3Star), value: 1),
                  CocktailIngredient(.otherAlcohol(.bataviaArrack), value: 1)]

var banhMiTags = Tags(profiles: [.savory, .refreshing, .funky, .restorative],
                      styles: [.sour, .shaken])
