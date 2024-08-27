//
//  Croque M. Petraske or Croque Mme Moger.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var croquePetraske  = Cocktail(cocktailName: "Croque M. Petraske or Croque Mme Moger",
                               glasswareType: .fizzGlass,
                               garnish: [.orangePeel],
                               ice: .koldDraft,
                               author: sashaPetraske,
                               spec: croquePetraskeSpec,
                               buildOrder: croquePetraskeBuild,
                               tags: croquePetraskeTags,
                               variation: nil,
                               collection: .milkAndHoney)

var croquePetraskeSpec  = [OldCocktailIngredient(.amari(.campari), value: 1.5),
                           OldCocktailIngredient(.gins(.plymouth), value: 1),
                           OldCocktailIngredient(.soda(.sodaWater) , value: 4)]

var croquePetraskeBuild  = Build(instructions: [Instruction(step: 1, method: "To make the Monsieur cocktail, pour the Campari over two medium ice cubes in a frozen highball glass and top off with club soda. Stir to combine."),
                                                Instruction(step: 2, method: "To make the Madame, prepare the drink the same way, but add the gin and garnish with an orange twist, if you have one.")])

var croquePetraskeTags   = Tags(flavors: [.lemon, .orange],
                                profiles: [.citrusy, .floral, .effervescent, .light, .fruity],
                                styles: [.collins, .shaken, .fizz])

