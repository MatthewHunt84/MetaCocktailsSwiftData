//
//  MorningGloryFizz(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var morningGloryFizzWnG = Cocktail(cocktailName: "Morning Glory Fizz (W&G Version)",
                                   glasswareType: .fizzGlass,
                                   garnish: [.lemonExpression],
                                   ice: nil,
                                   author: williamsAndGraham,
                                   spec: morningGloryFizzSpecWnG,
                                   buildOrder: morningGloryFizzWnGBuild,
                                   tags: morningGloryFizzTags,
                                   variation: .morningGloryFizz,
                                   collection: .williamsAndGraham)

var morningGloryFizzSpecWnG = [OldCocktailIngredient(.soda(.sodaWater), value: 2),
                               OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                               OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                               OldCocktailIngredient(.juices(.lemon), value: 5),
                               OldCocktailIngredient(.juices(.lime), value: 3),
                               OldCocktailIngredient(.otherAlcohol(.absinthe), value: 4, unit: .dashes),
                               OldCocktailIngredient(.whiskies(.glenfiddich12), value: 2)]

var morningGloryFizzWnGBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients except the soda water and dry shake."),
                                                    Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold."),
                                                    Instruction(step: 3, method: "Immediately after shaking (with vigor), pop the tin and double strain into the soda."),
                                                    Instruction(step: 4, method: "You can also choose to top with soda, but we find that the head doesn't get as fluffy that way."),
                                                    Instruction(step: 5, method: "Express the lemon and then discard.")])
