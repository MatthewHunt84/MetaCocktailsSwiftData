//
//  BloodyMarry(WnG).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var bloodyMaryWnG  = Cocktail(cocktailName: "Bloody Mary" + wAndGTitleTag,
                               glasswareType: .collins,
                               garnish: [.olive, .cocktailOnion],
                               author: williamsAndGraham,
                               spec: bloodyMarryWnGSpec,
                               buildOrder: bloodyMarryWnGBuild,
                               tags: bloodyMarryWnGTags,
                               variation: .bloodyMary,
                              collection: .williamsAndGraham)

var bloodyMarryWnGSpec  = [OldCocktailIngredient(.otherNonAlc(.bloodyMaryMixWnG), value: 4),
                           OldCocktailIngredient(.vodkas(.vodkaAny), value: 2)]



var bloodyMarryWnGTags   = Tags(profiles: [.savory, .rich, .restorative])

