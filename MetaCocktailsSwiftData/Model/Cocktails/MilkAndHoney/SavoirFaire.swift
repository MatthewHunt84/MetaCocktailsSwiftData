//
//  SavoirFaire.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/29/24.
//

import Foundation

var savoirFaire = Cocktail(cocktailName: "Savoir Faire",
                           glasswareType: .coupe,
                           garnish: [.lemonPeel],
                           ice: nil,
                           author:Author(person: AuthorNames.laurenMcLaughlin.rawValue ,  place: AuthorPlaces.milkAndHoney.rawValue , year: "Early 2000s"),
                           spec: savoirFaireSpec,
                           buildOrder: savoirFaireBuild,
                           tags: savoirFaireTags,
                           collection: .milkAndHoney)

var savoirFaireSpec     =  [OldCocktailIngredient(.amari(.aveze), value: 0.25),
                            OldCocktailIngredient(.fortifiedWines(.dolinDry), value: 0.25),
                            OldCocktailIngredient(.gins(.ginAny), value: 2),
                            OldCocktailIngredient(.otherNonAlc(.orangeFlowerWater), value: 2, unit: .sprays)]

var savoirFaireTags     = Tags(flavors: [.lemon],
                               profiles: [.spiritForward, .bittersweet, .fruity],
                               styles: [.manhattan, .stirred])


