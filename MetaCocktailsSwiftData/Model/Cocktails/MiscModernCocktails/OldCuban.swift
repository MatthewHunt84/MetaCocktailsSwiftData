//
//  OldCuban.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation


var oldCuban = Cocktail(cocktailName: "Old Cuban",
                        imageAsset: nil,
                        glasswareType: .coupe,
                        garnish: [.mintSprig],
                        ice: nil,
                        author: Author(person: AuthorNames.audrySaunders.rawValue, place: "Beacon", year: "2001"),
                        spec: oldCubanSpec,
                        buildOrder: oldCubanBuild,
                        tags: oldCubanTags,
                        variation: .oldCuban,
                        titleCocktail: true)

let oldCubanSpec: [CocktailIngredient] = [CocktailIngredient(.herbs(.mint), value: 6, unit: .gentlyMuddled),
                                          CocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                                          CocktailIngredient(.juices(.lime), value: 0.75),
                                          CocktailIngredient(.syrups(.simple), value: 1),
                                          CocktailIngredient(.rums(.rumAged), value: 1.5),
                                          CocktailIngredient(.wines(.champagne), value: 2)]


let oldCubanBuild =  Build(instructions: [Instruction(step: 1, method: "Shake all of the ingredients, except for the champagne, in a tin. Use Kold draft of Hoshizake cubes and the mint will the muddled while you're shaking."),
                                          Instruction(step: 2, method: "Double strain the shaken cocktail over the champagne in a chilled glass."),
                                          Instruction(step: 3, method: "Garnish with a mint sprig.")])

let oldCubanTags = Tags(profiles: [.herbal, .refreshing, .light, .effervescent],
                      styles: [.sour, .shaken])
