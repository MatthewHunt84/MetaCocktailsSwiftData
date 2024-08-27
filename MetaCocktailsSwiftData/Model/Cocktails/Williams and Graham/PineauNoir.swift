//
//  PineauNoir.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var pineauNoir = Cocktail(cocktailName: "Pineau Noir",
                          glasswareType: .doubleOld,
                          garnish: [.lemonPeel],
                          ice: .bigRock,
                          author:Author(place: AuthorPlaces.williamsAndGraham.rawValue),
                          spec: pineauNoirSpec,
                          buildOrder: nil,
                          tags: pineauNoirTags,
                          collection: .williamsAndGraham)

var pineauNoirSpec  = [OldCocktailIngredient(.bitters(.angosturaBitters), value: 2),
                       OldCocktailIngredient(.fortifiedWines(.bonal), value: 0.75),
                       OldCocktailIngredient(.fortifiedWines(.aeDorPineauDeCharantes), value: 0.75),
                       OldCocktailIngredient(.whiskies(.wildTurkeyRye), value: 1.5)]

var pineauNoirTags = Tags(flavors: [.lemon],
                          profiles: [.herbal, .punchy, .spiritForward, .complex],
                          styles: [.stirred, .manhattan])
