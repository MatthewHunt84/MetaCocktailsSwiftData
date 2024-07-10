//
//  PrettyInParadox.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var prettyInParadox = Cocktail(cocktailName: "Pretty In Paradox",
                               imageAsset: nil,
                               glasswareType: .doubleOld,
                               garnish: nil,
                               ice: .bigRock,
                               author: Author(person: AuthorNames.saydeeCanada.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue, year: "2019"),
                               spec: prettyInParadoxSpec,
                               tags: prettyInParadoxTags,
                               collection: .williamsAndGraham)

let prettyInParadoxSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                                                 OldCocktailIngredient(.amari(.cynar), value: 0.25),
                                                 OldCocktailIngredient(.fortifiedWines(.lustauPX), value: 0.25),
                                                 OldCocktailIngredient(.amari(.amaroNonino), value: 0.5),
                                                 OldCocktailIngredient(.whiskies(.russels6yearRye), value: 1.5)]


let prettyInParadoxTags = Tags(profiles: [.punchy, .complex, .herbal, .spiritForward],
                               styles: [.stirred, .oldFashioned])
