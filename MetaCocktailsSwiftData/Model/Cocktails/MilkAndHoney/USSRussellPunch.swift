//
//  USSRussellPunch.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var uSSRussellPunch = Cocktail(cocktailName: "U.S.S. Russell Punch",
                               glasswareType: .punchBowl,
                               garnish: [.cinnamonSticksAndCloves],
                               ice: .oneLargeBlock,
                               author: Author(person: AuthorNames.sashaPetraske.rawValue,
                                              place: AuthorPlaces.milkAndHoney.rawValue,
                                              year: "Early 2000s"),
                               spec: uSSRussellPunchSpec,
                               buildOrder: uSSRussellPunchBuild,
                               tags: uSSRussellPunchTags,
                               variation: nil,
                               collection: .milkAndHoney,
                               titleCocktail: false)

var uSSRussellPunchSpec = [OldCocktailIngredient(.fruit(.lemons), value: 50, unit: .whole),
                           OldCocktailIngredient(.otherNonAlc(.granulatedSugar), value: 1360, unit: .grams),
                           OldCocktailIngredient(.otherNonAlc(.nutmegGrated), value: 1, unit: .tablespoon),
                           OldCocktailIngredient(.rums(.appletonEstateSignatureBlend), value: 3, unit: .bottles),
                           OldCocktailIngredient(.rums(.rumDark), value: 3, unit: .bottles),
                           OldCocktailIngredient(.rums(.rumWhite), value: 3, unit: .bottles),
                           OldCocktailIngredient(.wines(.prosecco), value: 6, unit: .bottles) ]

var uSSRussellPunchTags = Tags(flavors: [.nutmeg, .clove, .cinnamon], profiles: [.aromatic, .refreshing, .citrusy, .effervescent],
                               styles: [.punch, .built])

var uSSRussellPunchBuild = Build(instructions: [Instruction(step: 1, method: "Start by peeling and juicing the lemons. Then, set the peels aside to make an oleo saccharum."),
                                                Instruction(step: 2, method: "Combine the lemon peels and sugar in a large punch bowl and let stand for 1½ and up to 4 hours."),
                                                Instruction(step: 3, method: "Discard 80 percent of the peels from the sugar, brushing any sugar clinging to the peels back into the bowl."),
                                                Instruction(step: 4, method: "Add the lemon juice to the sugar; then add the 750ml bottles of Jamaican, 750ml bottles of white, and 750ml bottles of dark rums and gently whisk. "),
                                                Instruction(step: 5, method: "Top off with 2 to 3 750ml bottles of bottles of Prosecco; add the nutmeg and whisk again. "),
                                                Instruction(step: 6, method: "Add a 5-inch (13 cm) square block of ice and the cinnamon sticks and cloves. Refresh the punch with more Prosecco over the course of the party."),
                                                Instruction(step: 7, method: "Makes 10 liters.")])
