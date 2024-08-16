//
//  PiscoSour (W&G Version).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/12/24.
//

import Foundation

var piscoSourWnG = Cocktail(cocktailName: "Pisco Sour (W&G Version)",
                            glasswareType: .coupe,
                            garnish: [.angoDeco],
                            ice: nil,
                            author:Author(place: AuthorPlaces.williamsAndGraham.rawValue, year: "2014"),
                            spec: piscoSourSpecWnG,
                            buildOrder: piscoSourBuildWnG,
                            tags: piscoSourTagsWnG,
                            variation: .piscoSour,
                            collection: .williamsAndGraham)

var piscoSourSpecWnG  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                         OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                         OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 1, unit: .whole),
                         OldCocktailIngredient(.brandies(.peruvianMustoVerde), value: 1.5),
                         OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes)]

var piscoSourTagsWnG = Tags(profiles: [.light, .silky, .fruity, .refreshing],
                            styles: [.sour, .shaken])

var piscoSourBuildWnG = Build(instructions: [Instruction(step: 1, method: "Add all ingredients accept for the bitters into a tin a dry shake to emulsify"),
                                             Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold. Do not over dilute"),
                                             Instruction(step: 3, method: "Immediately after shaking (with vigor), pop the tin and double strain very carefully into a stemmed glass. Create the least amount of turbulence here so that you create a smooth and even surface for the design with the bitters."),
                                             Instruction(step: 4, method: "Wait about 30 seconds after you stain out the cocktail to make the design over the top. It helps for the egg whites to settle for a bit to give you a better and more even canvas to work with.")])

