//
//  NewYorkSour.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var NewYorkSour = Cocktail(cocktailName: "New York Sour",
                           glasswareType: .stemmedGlassware,
                           garnish: nil,
                           ice: nil,
                           author:Author(person: "'Set Em' Up Again, Please!' Boston Herald",
                                         year: "December, 13, 1885, pg. 18"),
                           spec: NewYorkSourSpec,
                           buildOrder: NewYorkSourBuild,
                           tags: NewYorkSourTags,
                           variation: .newYorkSour,
                           collection: .originals,
                           titleCocktail: true)

var NewYorkSourSpec = [OldCocktailIngredient(.juices(.lemon), value: 0.25),
                       OldCocktailIngredient(.syrups(.simple), value: 0.25),
                       OldCocktailIngredient(.juices(.orange), value: 0.125),
                       OldCocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 2),
                       OldCocktailIngredient(.wines(.dryRedWine), value: 0.5)]

var NewYorkSourTags = Tags(profiles: [.citrusy, .light, .refreshing],
                           styles: [.sour, .shaken])

var NewYorkSourBuild = Build(instructions: [Instruction(step: 1, method: "Mix all ingredients, except the red wine, together in a tin and shake with ice."),
                                            Instruction(step: 2, method: "Strain into a chilled cocktail glass."),
                                            Instruction(step: 3, method: "Carefully float the red wine on top of the cocktail so that there's a clear separation between the wine and the rest of the cocktail.")])
