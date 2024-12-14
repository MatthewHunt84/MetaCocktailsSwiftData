//
//  OldCuban.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation


var oldCuban = Cocktail(cocktailName: "Old Cuban",
                        glasswareType: .coupe,
                        garnish: [.mintSprig],
                        ice: nil,
                        author: Author(person: AuthorNames.audrySaunders.rawValue, place: "Beacon", year: "2001"),
                        spec: oldCubanSpec,
                        buildOrder: oldCubanBuild,
                        tags: oldCubanTags,
                        variation: .oldCuban,
                        titleCocktail: true)

let oldCubanSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.herbs(.mint), value: 6, unit: .gentlyMuddled),
                                          OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                                          OldCocktailIngredient(.juices(.lime), value: 0.75),
                                          OldCocktailIngredient(.syrups(.simple), value: 1, prep: PrepBible.simpleSyrupPrep),
                                          OldCocktailIngredient(.rums(.rumAged), value: 1.5),
                                          OldCocktailIngredient(.wines(.champagne), value: 2)]




let oldCubanTags = Tags(profiles: [.herbal, .refreshing, .light, .effervescent],
                      styles: [.sour, .shaken])
