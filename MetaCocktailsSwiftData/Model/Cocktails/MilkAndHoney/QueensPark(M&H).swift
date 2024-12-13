//
//  QueensPark(M&H).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var queensParkMnH = Cocktail(cocktailName: "Queen's Park Swizzle (Dark)",
                             glasswareType: .collins,
                             garnish: [.mintBouquet],
                             ice: .pebbleIce,
                             author: Author(person: AuthorNames.richardBoccato.rawValue,
                                            place: AuthorPlaces.milkAndHoney.rawValue,
                                            year: "Early 2000s"),
                             spec: queensParkMnHSpec,
                             buildOrder: queensParkMnHBuild,
                             tags: queensParkMnHTags,
                             variation: .queensParkSwizzle,
                             collection: .milkAndHoney,
                             titleCocktail: false)

var queensParkMnHSpec = [OldCocktailIngredient(.herbs(.mint), value: 10, unit: .gentlyMuddled),
                         OldCocktailIngredient(.otherNonAlc(.demeraraSugarCube), value: 1, unit: .gentlyMuddled),
                         OldCocktailIngredient(.juices(.lime), value: 1),
                         OldCocktailIngredient(.syrups(.demSyrupOneToOne), value: 0.75, prep: PrepBible.demSyrupPrep),
                         OldCocktailIngredient(.rums(.rumDemerara), value: 2),
                         OldCocktailIngredient(.bitters(.angosturaBitters), value: 5, unit: .dashes) ]

var queensParkMnHTags = Tags(flavors: [.lime, .mint, .bakingSpices],
                             profiles: [.aromatic, .refreshing, .citrusy, .light],
                             styles: [.swizzle, .sour])


