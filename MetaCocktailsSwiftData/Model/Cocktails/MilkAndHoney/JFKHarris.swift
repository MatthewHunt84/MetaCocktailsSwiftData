//
//  JFKHarris.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/12/24.
//

import Foundation

var jFKHarris = Cocktail(cocktailName: "JFK Harris",
                         glasswareType: .doubleOld,
                         garnish: [.cucumberSlices],
                         ice: .bigRock ,
                         author:Author(person: AuthorNames.zacharyRubin.rawValue ,
                                       place: AuthorPlaces.milkAndHoney.rawValue ,
                                       year: "Early 2000s"),
                         spec: jFKHarrisSpec,
                         buildOrder: jFKHarrisBuild,
                         tags: jFKHarrisTags,
                         variation: nil ,
                         collection: .milkAndHoney)

var jFKHarrisSpec     =  [CocktailIngredient(.herbs(.mint), value: 11, unit: .gentlyMuddled),
                          CocktailIngredient(.syrups(.simple), value: 0.75),
                          CocktailIngredient(.juices(.lemon), value: 0.75),
                          CocktailIngredient(.rums(.rumWhite), value: 2),
                          CocktailIngredient(.wines(.dryRedWine), value: 0.5, unit: .fluidOuncesFloated),]

var jFKHarrisTags     = Tags(profiles: [.savory, .refreshing, .citrusy, .complex],
                             styles: [.sour, .shaken])

var jFKHarrisBuild = Build(instructions: [Instruction(step: 1, method: "Combine the rum, lemon juice, simple syrup, and mint in a cocktail shaker, fill with ice, and shake vigorously until the drink is sufficiently chilled."),
                                          Instruction(step: 2, method: "Strain into a double rocks glass filled with a single large ice cube. "),
                                          Instruction(step: 3, method: "Slowly float a finger of red wine on top.")])
