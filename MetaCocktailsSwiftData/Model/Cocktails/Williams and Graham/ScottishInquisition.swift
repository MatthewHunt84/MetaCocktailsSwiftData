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
                                    tags: scottishInquisitionTags)

var scottishInquisitionSpec  = [CocktailIngredient(.bitters(.chocolateMole), value: 1, unit: .dash),
                                 CocktailIngredient(.amari(.averna), value: 0.75),
                                 CocktailIngredient(.fortifiedWines(.cocchiDeTorino), value: 0.75),
                                 CocktailIngredient(.rums(.avuaAmburana), value: 0.5),
                                 CocktailIngredient(.whiskies(.talisker10), value: 1.5)]

var scottishInquisitionTags = Tags(profiles: [.herbal, .spiritForward, .complex],
                                    styles: [.stirred, .manhattan])
