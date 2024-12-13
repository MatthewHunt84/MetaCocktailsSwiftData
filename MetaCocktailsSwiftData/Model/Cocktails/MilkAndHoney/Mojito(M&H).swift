//
//  Mojito(M&H).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var mojitoMnH = Cocktail(cocktailName: "Mojito" + mAndHVersionTag,
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



