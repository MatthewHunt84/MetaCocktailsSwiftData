//
//  FeatheredHatFlip.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var featheredHatFlipNo1 = Cocktail(cocktailName: "Feathered Hat Flip No. 1",
                                   glasswareType: .snifter,
                                   garnish: [.nutmeg],
                                   ice: nil,
                                   author: Author(person: AuthorNames.jamesMenkal.rawValue,
                                                  place: AuthorPlaces.williamsAndGraham.rawValue,
                                                  year: "2018"),
                                   spec: featheredHatFlipSpec,
                                   buildOrder: featheredHatFlipBuild,
                                   tags: featheredHatFlipTags,
                                   variation: .featheredHatFlip,
                                   collection: .williamsAndGraham,
                                   titleCocktail: true)

var featheredHatFlipSpec  = [CocktailIngredient(.bitters(.angosturaBitters), value: 8, unit: .drops),
                             CocktailIngredient(.otherAlcohol(.leftHandMilkStout), value: 0.5),
                             CocktailIngredient(.liqueurs(.velvetFalernum), value: 0.5),
                             CocktailIngredient(.liqueurs(.giffardBanane), value: 0.5),
                             CocktailIngredient(.rums(.cruzanBlackstrap), value: 0.5),
                             CocktailIngredient(.whiskies(.russels6yearRye), value: 0.75),
                             CocktailIngredient(.otherNonAlc(.eggWhole), value: 1, unit: .whole)]

var featheredHatFlipTags = Tags(flavors: [.nutmeg],
                                profiles: [.rich, .silky, .savory],
                                styles: [.flip, .shaken])

var featheredHatFlipBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except the bitters, into a tin a dry shake to emulsify"),
                                                 Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold."),
                                                 Instruction(step: 3, method: "Immediately after shaking, pop the tin and double strain into a flip glass."),
                                                 Instruction(step: 4, method: "Make a design with angostura on top.")])
