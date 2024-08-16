//
//  TheRuralJuror.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var theRuralJuror  =  Cocktail(cocktailName: "The Rural Juror",
                               glasswareType: .doubleOld,
                               garnish: [.orangePeel],
                               ice: .bigRock,
                               author:Author(place: AuthorPlaces.williamsAndGraham.rawValue),
                               spec: theRuralJurorSpec,
                               buildOrder: nil,
                               tags: theRuralJurorTags,
                               collection: .williamsAndGraham)

var theRuralJurorSpec = [OldCocktailIngredient(.liqueurs(.velvetFalernum), value: 0.25),
                         OldCocktailIngredient(.fortifiedWines(.cocchiDeTorino), value: 0.5),
                         OldCocktailIngredient(.amari(.angosturaAmaro), value: 0.5),
                         OldCocktailIngredient(.brandies(.armagnac), value: 2)]

var theRuralJurorTags = Tags(flavors: [.orange],
                             profiles: [.rich, .bittersweet, .punchy, .spiritForward],
                             styles: [.martini, .stirred])
