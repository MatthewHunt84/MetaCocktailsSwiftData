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

var savoirFaireTags     = Tags(profiles: [.spiritForward, .bittersweet, .fruity],
                               styles: [.manhattan, .stirred])

var savoirFaireBuild  = Build(instructions: [Instruction(step: 1, method: "Combine everything but the orange blossom water into a mixing glass and stir with ice."),
                                             Instruction(step: 2, method: "Prep a chilled coupe by spraying the orange blossom water into the glass before adding the stirred cocktail."),
                                             Instruction(step: 3, method: "Twist the lemon peel over the cocktail and add the twist in.")])
