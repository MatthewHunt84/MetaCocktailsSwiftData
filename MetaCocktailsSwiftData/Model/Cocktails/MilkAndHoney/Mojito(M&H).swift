//
//  Mojito(M&H).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var mojitoMnH = Cocktail(cocktailName: "Mojito" + mAndHVersionTag,
                         imageAsset: nil,
                         glasswareType: .doubleOld,
                         garnish: [.mintBouquet],
                         ice: .pebbleIce,
                         author: Author(person: nil,
                                        place: AuthorPlaces.milkAndHoney.rawValue,
                                        year: "Early 2000s"),
                         spec: mojitoSpecMnH,
                         buildOrder: mojitoBuildMnH,
                         tags: mojitoTagsMnH,
                         variation: .mojito,
                         collection: .milkAndHoney,
                         titleCocktail: false)

let mojitoSpecMnH: [OldCocktailIngredient] = [OldCocktailIngredient(.herbs(.mint), value: 10, unit: .gentlyMuddled),
                                              OldCocktailIngredient(.otherNonAlc(.demeraraSugarCube), value: 1, unit: .muddled),
                                              OldCocktailIngredient(.juices(.lime), value: 1),
                                              OldCocktailIngredient(.syrups(.simple), value: 1, prep: PrepBible.simpleSyrupPrep),
                                              OldCocktailIngredient(.rums(.rumWhite), value: 2)]

let mojitoTagsMnH = Tags(profiles: [.herbal, .refreshing, .light],
                         styles: [.sour, .shaken, .built])

let mojitoBuildMnH =  Build(instructions: [Instruction(step: 1, method: "Combine the mint, lime juice, simple syrup, and sugar cube in a cocktail shaker and gently muddle (bruise, but don't abuse!)."),
                                           Instruction(step: 2, method: "Add the rum and pour into a chilled rocks glass. "),
                                           Instruction(step: 3, method: "Top off with crushed ice and garnish with a bouquet of mint sprigs.")])

