//
//  SilverLining.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var silverLining  = Cocktail(cocktailName: "Silver Lining",
                             glasswareType: .collins,
                             garnish: nil,
                             ice: .columnIce,
                             author: Author(person: AuthorNames.josephSchwartz.rawValue,
                                            place: AuthorPlaces.milkAndHoney.rawValue,
                                            year: "2001"),
                             spec: silverLiningSpec,
                             buildOrder: silverLiningBuild,
                             tags: silverLiningTags,
                             variation: nil,
                             collection: .milkAndHoney)

var silverLiningSpec  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                         CocktailIngredient(.otherNonAlc(.eggWhites), value: 1, unit: .whole),
                         CocktailIngredient(.liqueurs(.licor43), value: 0.75),
                         CocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 1.5),
                         CocktailIngredient(.soda(.sodaWater) , value: 6)]

var silverLiningBuild  = Build(instructions: [Instruction(step: 1, method: "Combine the whiskey, egg white, lemon juice, and Licor 43 in a cocktail shaker and shake to emulsify the mixture."),
                                              Instruction(step: 2, method: "Add 1 large ice cube and shake vigorously until the drink is sufficiently chilled."),
                                              Instruction(step: 3, method: "Strain into a chilled Collins glass filled long Collins ice cube. "),
                                              Instruction(step: 4, method: "Top off with club soda until the froth reaches the rim of the glass."),
                                              Instruction(step: 4, method: "Let stand for a moment so the foam settles, then add more club soda to raise the froth just over the rim of the glass.")])

var silverLiningTags   = Tags(profiles: [.citrusy, .light, .silky, .effervescent],
                              styles: [.collins, .shaken])

