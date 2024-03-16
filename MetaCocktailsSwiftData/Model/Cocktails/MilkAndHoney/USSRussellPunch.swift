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

var uSSRussellPunchSpec = [CocktailIngredient(.fruit(.lemons), value: 50, unit: .peeledAndJuiced),
                           CocktailIngredient(.otherNonAlc(.granulatedSugar), value: 1360, unit: .grams),
                           CocktailIngredient(.otherNonAlc(.nutmegGrated), value: 1, unit: .tablespoon),
                           CocktailIngredient(.rums(.appletonEstateSignatureBlend), value: 3, unit: .bottles),
                           CocktailIngredient(.rums(.rumDark), value: 3, unit: .bottles),
                           CocktailIngredient(.rums(.rumWhite), value: 3, unit: .bottles),
                           CocktailIngredient(.wines(.prosecco), value: 6, unit: .bottles) ]

var uSSRussellPunchTags = Tags(profiles: [.aromatic, .refreshing, .citrusy, .effervescent],
                               styles: [.punch, .built])

var uSSRussellPunchBuild = Build(instructions: [Instruction(step: 1, method: "Combine the lemon peels and sugar in a large punch bowl and let stand for 1½ and up to 4 hours."),
                                                Instruction(step: 2, method: "Discard 80 percent of the peels from the sugar, brushing any sugar clinging to the peels back into the bowl."),
                                                Instruction(step: 3, method: "Add the lemon juice to the sugar; then add the Jamaican, white, and dark rums and gently whisk. "),
                                                Instruction(step: 4, method: "Top off with 2 to 3 bottles of prosecco; add the nutmeg and whisk again. "),
                                                Instruction(step: 5, method: "Add a 5-inch (13 cm) square block of ice and the cinnamon sticks and cloves. Refresh the punch with more prosecco over the course of the party."),
                                                Instruction(step: 6, method: "Makes 10 liters.")])
