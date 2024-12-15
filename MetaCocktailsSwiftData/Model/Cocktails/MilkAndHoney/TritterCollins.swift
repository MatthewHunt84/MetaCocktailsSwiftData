//
//  TritterCollins.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var tritterCollins  = Cocktail(cocktailName: "Tritter Collins",
                               glasswareType: .collins,
                               garnish: [.grapefruitPeel],
                               ice: .columnIce,
                               author: sashaPetraske,
                               spec: tritterCollinsSpec,
                               buildOrder: tritterCollinsBuild,
                               tags: tritterCollinsTags,
                               variation: nil,
                               collection: .milkAndHoney)

var tritterCollinsSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                           OldCocktailIngredient(.juices(.grapefruit), value: 1),
                           OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                           OldCocktailIngredient(.otherAlcohol(.absinthe), value: 0.25),
                           OldCocktailIngredient(.gins(.ginAny), value: 2),
                           OldCocktailIngredient(.soda(.sodaWater) , value: 0.5)]



var tritterCollinsTags   = Tags(flavors: [.lemon],
                                profiles: [.citrusy, .effervescent, .light, .fruity],
                                styles: [.collins, .shaken])

