//
//  RedHookCocktail.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/29/24.
//

import Foundation

var redHookCocktail = Cocktail(cocktailName: "Red Hook Cocktail",
                               glasswareType: .coupe,
                               garnish: nil,
                               ice: nil,
                               author:Author(person: AuthorNames.vincenzoErrico.rawValue ,  place: AuthorPlaces.milkAndHoney.rawValue , year: "2003"),
                               spec: redHookCocktailSpec,
                               buildOrder: nil,
                               tags: redHookCocktailTags,
                               collection: .milkAndHoney)

var redHookCocktailSpec     =  [CocktailIngredient(.fortifiedWines(.puntEMes), value: 0.5),
                                CocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.5),
                                CocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 2)]

var redHookCocktailTags     = Tags(profiles: [.spiritForward, .bittersweet, .fruity],
                                   styles: [.manhattan, .stirred])
