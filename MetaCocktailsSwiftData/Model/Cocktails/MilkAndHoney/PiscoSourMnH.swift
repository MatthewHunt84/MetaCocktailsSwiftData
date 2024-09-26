//
//  PiscoSourMnH.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/12/24.
//

import Foundation

var piscoSourMnH = Cocktail(cocktailName: "Pisco Sour" + mAndHVersionTag,
                            glasswareType: .coupe,
                            garnish: [.cinnamon],
                            ice: nil,
                            author:Author(place: AuthorPlaces.milkAndHoney.rawValue, year: "Early 2000s"),
                            spec: piscoSourSpecMnH,
                            buildOrder: piscoSourBuildMnH,
                            tags: piscoSourTagsMnH,
                            variation: .piscoSour,
                            collection: .milkAndHoney)

var piscoSourSpecMnH  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                         OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                         OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 1, unit: .whole),
                         OldCocktailIngredient(.brandies(.pisco), value: 2),
                         OldCocktailIngredient(.bitters(.angosturaBitters), value: 3, unit: .dashes)]

var piscoSourTagsMnH = Tags(flavors: [.cinnamon],
                            profiles: [.light, .silky, .fruity, .refreshing],
                            styles: [.sour, .shaken])

var piscoSourBuildMnH = Build(instructions: [Instruction(step: 1, method: "Add all ingredients accept for the bitters into a tin a dry shake to emulsify"),
                                             Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold. Do not over dilute"),
                                             Instruction(step: 3, method: "Immediately after shaking (with vigor), pop the tin and double strain very carefully into a stemmed glass. Create the least amount of turbulence here so that you create a smooth and even surface for the design with the bitters."),
                                             Instruction(step: 4, method: "Wait about 30 seconds after you stain out the cocktail to make the design over the top. It helps for the egg whites to settle for a bit to give you a better and more even canvas to work with.")])

