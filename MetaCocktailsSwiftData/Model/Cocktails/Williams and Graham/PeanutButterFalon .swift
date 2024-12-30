//
//  PeanutButterFalon .swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation

var peanutButterFalcon = Cocktail(cocktailName: "Peanut Butter Falcon",
                                  glasswareType: .stemmedGlassware,
                                  garnish: nil,
                                  ice: nil,
                                  author:Author(person: AuthorNames.jamesMenkal.rawValue,
                                                place: AuthorPlaces.williamsAndGraham.rawValue),
                                  spec: peanutButterFalconSpec,
                                  buildOrder: peanutButterFalconBuild,
                                  tags: peanutButterFalconTags,
                                  collection: .williamsAndGraham)

var peanutButterFalconSpec  = [OldCocktailIngredient(.syrups(.honeySyrup), value: 0.25, prep: PrepBible.honeySyrup),
                               OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                               OldCocktailIngredient(.amari(.angosturaAmaro), value: 0.5),
                               OldCocktailIngredient(.liqueurs(.giffardBanane), value: 1),
                               OldCocktailIngredient(.vodkas(.peanutButterVodka), value: 1, prep: PrepBible.peanutButterVodka),
                               OldCocktailIngredient(.bitters(.blackWalnut), value: 2, unit: .dashes)]

var peanutButterFalconTags = Tags(flavors: [.nutmeg],
                                  profiles: [.rich, .silky, .savory, .bittersweet],
                                  styles: [.flip, .shaken])


