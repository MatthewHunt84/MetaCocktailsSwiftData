//
//  Penicillin.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 9/25/23.
//

import SwiftUI

var penicillin = Cocktail(name: "Penicillin",
                          imageName: Image(.emptyCocktail),
                          background: Color.brandPrimaryYellow,
                          glasswareType: Glassware.doubleOld,
                          garnish: [GarnishCatalog.candiedGinger.asset],
                          ice: Ingredient.bigRock,
                          author: "Sasha Petraske",
                          spec: penicillinSpec,
                          buildOrder: penicillinBuild,
                          tags: penicillinTags)

var penicillinSpec: [CocktailIngredient] = [CocktailIngredient(name: .lemon, value: 0.75, unit: .fluidOunces),
                                            CocktailIngredient(name: .honeySyrup, value: 0.375, unit: .fluidOunces), 
                                            CocktailIngredient(name: .gingerSyrup, value: 0.375, unit: .fluidOunces),
                                            CocktailIngredient(name: .peatedScotch, value: 0.25, unit: .fluidOunces)]

var penicillinBuild = Build(instructions: [Instruction(step: 1, method: "Mix all ingredients, except the Isla Scotch, together in a tin and shake with ice."), 
                                           Instruction(step: 2, method: "Strain over ice."),
                                           Instruction(step: 3, method: "Float the Islay whisky on top of the cocktail"),
                                           Instruction(step: 4, method: "Garnish With a piece of candied ginger.")])

var penicillinTags = Tags(flavors: [.lemon, .honey, .ginger, .smokey, .peat],
                          textures: [.light],
                          styles: [.sour],
                          baseComponents: [.blendedScotch])
