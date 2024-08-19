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
                                  notes: peanutButterFalconNotes,
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

var peanutButterFalconBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients except the bitters into a tin shake with ice"),
                                                   Instruction(step: 2, method: "Strain into a stemmed glass."),
                                                   Instruction(step: 3, method: "Dash the bitters over the top of the glass so that it makes an X. The black walnut bitters will float to make the design.")])


var peanutButterFalconNotes = "The original cocktail used Amaro Nonino instead of Angostura amaro. But one week at Williams and Graham, we ran out of Nonino and I was forced to use something else and it turned out Ango Amaro was just better overall."
