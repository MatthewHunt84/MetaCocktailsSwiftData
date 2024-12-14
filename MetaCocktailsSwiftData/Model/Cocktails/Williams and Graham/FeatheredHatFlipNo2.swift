//
//  FeatheredHatFlipNo2.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var featheredHatFlipNo2 = Cocktail(cocktailName: "Feathered Hat Flip No. 2",
                                   glasswareType: .snifter,
                                   garnish: [.nutmeg],
                                   ice: nil,
                                   author: Author(person: AuthorNames.jamesMenkal.rawValue,
                                                  place: AuthorPlaces.williamsAndGraham.rawValue,
                                                  year: "2023"),
                                   spec: featheredHatFlip2Spec,
                                   buildOrder: featheredHatFlip2Build,
                                   tags: featheredHatFlip2Tags,
                                   collection: .williamsAndGraham)

var featheredHatFlip2Spec  = [OldCocktailIngredient(.otherNonAlc(.sesameOil), value: 8 ,unit: .drops),
                             OldCocktailIngredient(.otherAlcohol(.leftHandMilkStout), value: 1),
                             OldCocktailIngredient(.syrups(.cinnamonSyrup), value: 0.75, prep: PrepBible.cinnamonSyrup),
                             OldCocktailIngredient(.liqueurs(.giffardBanane), value: 0.5),
                             OldCocktailIngredient(.rums(.cruzanBlackstrap), value: 0.5),
                             OldCocktailIngredient(.rums(.diplomaticoExclusivaRum), value: 0.75),
                             OldCocktailIngredient(.otherNonAlc(.eggWhole), value: 1, unit: .whole)]

var featheredHatFlip2Tags = Tags(flavors: [.nutmeg],
                                profiles: [.rich, .silky, .savory],
                                styles: [.flip, .shaken])


