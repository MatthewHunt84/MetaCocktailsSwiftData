//
//  CorpseReviverNo1.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var corpseReviver1 = Cocktail(cocktailName: "Corpse Reviver No.1",
                              glasswareType: .stemmedGlassware,
                              author:Author(person: AuthorNames.harryCraddock.rawValue, place: AuthorPlaces.savoy.rawValue, year: "1930"),
                              spec: corpseReviver1Spec,
                              tags: corpseReviver1Tags,
                              variation: .corpseReviver)

var corpseReviver1Spec     =  [OldCocktailIngredient(.fortifiedWines(.dolinRouge), value: 1),
                               OldCocktailIngredient(.brandies(.pFAmber), value: 1),
                               OldCocktailIngredient(.brandies(.boulardCalvados), value: 1)]

var corpseReviver1Tags     = Tags(profiles: [.spiritForward, .fruity, .rich],
                                  styles: [.martini, .stirred])

