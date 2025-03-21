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
                                   collection: .williamsAndGraham)

var featheredHatFlipSpec  = [OldCocktailIngredient(.bitters(.angosturaBitters), value: 8, unit: .drops),
                             OldCocktailIngredient(.otherAlcohol(.leftHandMilkStout), value: 0.5),
                             OldCocktailIngredient(.liqueurs(.velvetFalernum), value: 0.5),
                             OldCocktailIngredient(.liqueurs(.giffardBanane), value: 0.5),
                             OldCocktailIngredient(.rums(.cruzanBlackstrap), value: 0.5),
                             OldCocktailIngredient(.whiskies(.russels6yearRye), value: 0.75),
                             OldCocktailIngredient(.otherNonAlc(.eggWhole), value: 1, unit: .whole)]

var featheredHatFlipTags = Tags(flavors: [.nutmeg],
                                profiles: [.rich, .silky, .savory],
                                styles: [.flip, .shaken])


