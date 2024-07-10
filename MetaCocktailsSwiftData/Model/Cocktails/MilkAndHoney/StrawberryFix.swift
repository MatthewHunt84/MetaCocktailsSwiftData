//
//  StrawberryFix.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var strawberryFix = Cocktail(cocktailName: "Strawberry Fix",
                             glasswareType: .doubleOld,
                             garnish: [.strawberryWhole],
                             ice: .pebbleIce,
                             author: Author(person: AuthorNames.sashaPetraske.rawValue,
                                            place: AuthorPlaces.milkAndHoney.rawValue,
                                            year: "Early 2000s"),
                             spec: queensParkLightMnHSpec,
                             buildOrder: queensParkLightMnHBuild,
                             tags: queensParkLightMnHTags,
                             variation: nil,
                             collection: .milkAndHoney,
                             titleCocktail: false)

var strawberryFixSpec = [OldCocktailIngredient(.fruit(.strawberryHalf), value: 4,  unit: .gentlyMuddled),
                         OldCocktailIngredient(.juices(.lemon), value: 0.75),
                         OldCocktailIngredient(.syrups(.simple), value: 0.75),
                         OldCocktailIngredient(.whiskies(.bourbonAny), value: 2)]

var strawberryFixTags = Tags(profiles: [.fruity, .refreshing, .citrusy, .light],
                             styles: [.shaken, .sour])

var strawberryFixBuild = Build(instructions: [Instruction(step: 1, method: "Taste a piece of quartered strawberry for sweetness and tartness."),
                                              Instruction(step: 2, method: "Add the quartered strawberries to a chilled double rocks glass and muddle very gently to create a layer of strawberry 'jam' on the bottom of the glass."),
                                              Instruction(step: 3, method: "Fill the glass to the top with crushed ice; set aside.  "),
                                              Instruction(step: 4, method: "Combine the lemon juice, simple syrup, and bourbon in a cocktail shaker and shake to mix. "),
                                              Instruction(step: 4, method: "Pour over the crushed ice in the rocks glass, garnish with the whole strawberry, and serve with a straw.")])
