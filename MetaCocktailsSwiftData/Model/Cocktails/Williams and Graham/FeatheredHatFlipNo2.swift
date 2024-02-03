//
//  FeatheredHatFlipNo2.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var featheredHatFlipNo2 = Cocktail(cocktailName: "Feathered Hat Flip No. 2",
                                   glasswareType: .snifter,
                                   garnish: [.sesameOil],
                                   ice: nil,
                                   author: Author(person: AuthorNames.jamesMenkal.rawValue,
                                                  place: AuthorPlaces.williamsAndGraham.rawValue,
                                                  year: "2023"),
                                   spec: featheredHatFlip2Spec,
                                   buildOrder: featheredHatFlip2Build,
                                   tags: featheredHatFlip2Tags)

var featheredHatFlip2Spec  = [CocktailIngredient(.otherNonAlc(.sesameOil), value: 6 ,unit: .drops),
                             CocktailIngredient(.otherAlcohol(.leftHandMilkStout), value: 1),
                             CocktailIngredient(.syrups(.cinnamonSyrup), value: 0.75),
                             CocktailIngredient(.liqueurs(.giffardBanane), value: 0.5),
                             CocktailIngredient(.rums(.cruzanBlackstrap), value: 0.5),
                             CocktailIngredient(.rums(.diplomaticoExclusivaRum), value: 0.75),
                             CocktailIngredient(.otherNonAlc(.eggWhole), value: 1, unit: .whole)]

var featheredHatFlip2Tags = Tags(flavors: [.nutmeg],
                                profiles: [.rich, .silky, .savory],
                                styles: [.flip, .shaken])

var featheredHatFlip2Build = Build(instructions: [Instruction(step: 1, method: "Add all ingredients into a tin a dry shake to emulsify"),
                                                 Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold."),
                                                 Instruction(step: 3, method: "Immediately after shaking, pop the tin and double strain into a flip glass."),
                                                 Instruction(step: 4, method: "float the sesame oil on top for aromatics.")])
