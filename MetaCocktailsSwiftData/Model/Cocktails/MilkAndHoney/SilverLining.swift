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

var silverLiningSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                         OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 1, unit: .whole),
                         OldCocktailIngredient(.liqueurs(.licor43), value: 0.75),
                         OldCocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 1.5),
                         OldCocktailIngredient(.soda(.sodaWater) , value: 6)]

var silverLiningBuild  = Build(instructions: [Instruction(step: 1, method: "Combine the whiskey, egg white, lemon juice, and Licor 43 in a cocktail shaker and shake to emulsify the mixture."),
                                              Instruction(step: 2, method: "Add one large ice cube and shake vigorously until the drink is sufficiently chilled."),
                                              Instruction(step: 3, method: "Strain into a chilled collins glass filled long collins ice cube. "),
                                              Instruction(step: 4, method: "Top off with club soda until the froth reaches the rim of the glass."),
                                              Instruction(step: 4, method: "Let stand for a moment so the foam settles, then add more club soda to raise the froth just over the rim of the glass.")])

var silverLiningTags   = Tags(profiles: [.citrusy, .light, .silky, .effervescent],
                              styles: [.collins, .shaken])

