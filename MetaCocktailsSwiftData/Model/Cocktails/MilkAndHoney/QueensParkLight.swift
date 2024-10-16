//
//  QueensParkLight.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var queensParkLightMnH = Cocktail(cocktailName: "Queen's Park Swizzle (Light)",
                                  glasswareType: .doubleOld,
                                  garnish: [.mintBouquet],
                                  ice: .pebbleIce,
                                  author: Author(person: AuthorNames.sashaPetraske.rawValue,
                                                 place: AuthorPlaces.milkAndHoney.rawValue,
                                                 year: "Early 2000s"),
                                  spec: queensParkLightMnHSpec,
                                  buildOrder: queensParkLightMnHBuild,
                                  tags: queensParkLightMnHTags,
                                  variation: .queensParkSwizzle,
                                  collection: .milkAndHoney,
                                  titleCocktail: false)

var queensParkLightMnHSpec = [OldCocktailIngredient(.herbs(.mint), value: 10, unit: .gentlyMuddled),
                              OldCocktailIngredient(.juices(.lime), value: 1),
                              OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                              OldCocktailIngredient(.rums(.rumWhite), value: 2),
                              OldCocktailIngredient(.bitters(.peychauds), value: 5, unit: .dashes) ]

var queensParkLightMnHTags = Tags(flavors: [.lime, .mint, .bakingSpices],
                                  profiles: [.aromatic, .refreshing, .citrusy, .light],
                                  styles: [.swizzle, .sour])

var queensParkLightMnHBuild = Build(instructions: [Instruction(step: 1, method: "Combine the mint, sugar cube, lime juice, and simple syrup in a cocktail shaker and gently muddle. "),
                                                   Instruction(step: 2, method: "Add the rum and swirl to combine. "),
                                                   Instruction(step: 3, method: "Pour the cocktail into a rocks glass and add crushed ice to come to just under the rim of the glass.  "),
                                                   Instruction(step: 4, method: "Add the bitters and lightly swizzle into a red layer on top of the drink, then top with more ice, shaping it into a cone."),
                                                   Instruction(step: 5, method: "Garnish with the mint sprig (tap it on the side of your hand to release the essential oils for the optimum aroma).")])
