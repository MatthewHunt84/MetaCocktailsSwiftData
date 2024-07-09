//
//  ScottishInquisition.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var scottishInquisition = Cocktail(cocktailName: "The Scottish Inquisition",
                                    glasswareType: .doubleOld,
                                    garnish: nil,
                                    ice: .bigRock,
                                    author:Author(person: "Jimmy Kenyon", place: AuthorPlaces.williamsAndGraham.rawValue, year: "2019"),
                                    spec: scottishInquisitionSpec,
                                    buildOrder: nil,
                                    tags: scottishInquisitionTags,
                                   collection: .williamsAndGraham)

var scottishInquisitionSpec  = [OldCocktailIngredient(.bitters(.chocolateMole), value: 1, unit: .dashes),
                                 OldCocktailIngredient(.amari(.averna), value: 0.75),
                                 OldCocktailIngredient(.fortifiedWines(.cocchiDeTorino), value: 0.75),
                                 OldCocktailIngredient(.rums(.avuaAmburana), value: 0.5),
                                 OldCocktailIngredient(.whiskies(.talisker10), value: 1.5)]

var scottishInquisitionTags = Tags(profiles: [.herbal, .spiritForward, .complex],
                                    styles: [.stirred, .manhattan])
