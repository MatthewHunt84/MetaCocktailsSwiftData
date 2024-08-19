//
//  DeepBlueSea.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/29/24.
//

import Foundation

var deepBlueSea = Cocktail(cocktailName: "Deep Blue Sea",
                           glasswareType: .coupe,
                           garnish: [.lemonPeel],
                           ice: nil,
                           author:Author(person: AuthorNames.michaelMadrusan.rawValue ,  place: AuthorPlaces.milkAndHoney.rawValue , year: "Early 2000s"),
                           spec: deepBlueSeaSpec,
                           tags: deepBlueSeaTags,
                           collection: .milkAndHoney)

var deepBlueSeaSpec     =  [OldCocktailIngredient(.bitters(.orangeBitters), value: 2, unit: .dashes),
                            OldCocktailIngredient(.syrups(.violetteSyrup), value: 0.25, prep: PrepBible.violetteSyrup),
                            OldCocktailIngredient(.fortifiedWines(.cocchiAmericano), value: 0.75),
                            OldCocktailIngredient(.gins(.ginAny), value: 2)]

var deepBlueSeaTags     = Tags(flavors: [.lemon],
                               profiles: [.spiritForward, .floral],
                               styles: [.martini, .stirred])
