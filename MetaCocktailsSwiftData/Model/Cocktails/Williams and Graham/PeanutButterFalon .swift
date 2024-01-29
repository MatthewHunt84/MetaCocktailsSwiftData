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
                                  tags: peanutButterFalconTags)

var peanutButterFalconSpec  = [CocktailIngredient(.syrups(.honeySyrup), value: 0.25),
                               CocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                               CocktailIngredient(.amari(.amaroNonino), value: 0.5),
                               CocktailIngredient(.liqueurs(.giffardBanane), value: 1),
                               CocktailIngredient(.vodkas(.peanutButterVodka), value: 1),
                               CocktailIngredient(.bitters(.blackWalnut), value: 2, unit: .dashes)]

var peanutButterFalconTags = Tags(flavors: [.nutmeg],
                                  profiles: [.rich, .silky, .savory, .bittersweet],
                                    styles: [.flip, .shaken])

var peanutButterFalconBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients except the bitters into a tin shake with ice"),
                                          Instruction(step: 2, method: "Strain into a stemmed glass."),
                                          Instruction(step: 3, method: "Dash the bitters over the top of the glass so that it makes an X. The black walnut bitters will float to make the design.")])
