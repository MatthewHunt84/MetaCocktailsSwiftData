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
                           OldCocktailIngredient(.syrups(.simple), value: 0.75),
                           OldCocktailIngredient(.otherAlcohol(.absinthe), value: 0.25),
                           OldCocktailIngredient(.gins(.ginAny), value: 2),
                           OldCocktailIngredient(.soda(.sodaWater) , value: 0.5)]

var tritterCollinsBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the soda, into a tin and shake with ice"),
                                                Instruction(step: 2, method: "Strain over column ice and top with soda"),
                                                Instruction(step: 3, method: "Give a gentle stir and then garnish with a grapefruit peel after expression.")])

var tritterCollinsTags   = Tags(flavors: [.lemon],
                                profiles: [.citrusy, .effervescent, .light, .fruity],
                                styles: [.collins, .shaken])

