//
//  WhiteLinen.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/17/24.
//

import Foundation

var whiteLinen = Cocktail(cocktailName: "White Linen",
                          glasswareType: .collins,
                          garnish: [.cucumberSlices],
                          ice: .koldDraft,
                          author:Author(person: AuthorNames.reneDominguez.rawValue,
                                        place: AuthorPlaces.ellaDiningRoom.rawValue,
                                        year: "2008"),
                          spec: whiteLinenSpec,
                          buildOrder: whiteLinenBuild,
                          tags: whiteLinenTags)

let whiteLinenSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.soda(.sodaWater), value: 2),
                                               OldCocktailIngredient(.fruit(.cucumberSlices), value: 6, unit: .gentlyMuddled),
                                               OldCocktailIngredient(.juices(.lime), value: 0.75),
                                               OldCocktailIngredient(.syrups(.richSimple), value: 0.34, prep: PrepBible.richSimple),
                                               OldCocktailIngredient(.liqueurs(.stGermaine), value: 0.5),
                                               OldCocktailIngredient(.gins(.hendricks), value: 1.5)]


let whiteLinenTags = Tags(profiles: [.refreshing, .light, .restorative],
                          styles: [.collins, .shaken])

let whiteLinenBuild =  Build(instructions: [Instruction(step: 1, method: "Muddle the cucumber into a mixing tin."),
                                            Instruction(step: 2, method: "Add all of the ingredients, leaving the soda for after you're done shaking."),
                                            Instruction(step: 3, method: "Double strain the shaken cocktail into an ice filled collins glass and top with soda."),
                                            Instruction(step: 4, method: "Garnish with cucumber.")])

