//
//  French75(M&H).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var french75MnH  = Cocktail(cocktailName: "French 75(Milk & Honey version)",
                           glasswareType: .flute,
                            garnish: [.lemonPeel],
                           ice: nil,
                           author: sashaPetraske,
                           spec: french75MnHSpec,
                           buildOrder: french75MnHBuild,
                           tags: french75MnHTags,
                           variation: .french75,
                           collection: .milkAndHoney)

var french75MnHSpec  = [CocktailIngredient(.juices(.lemon), value: 0.5),
                       CocktailIngredient(.syrups(.simple), value: 0.5),
                       CocktailIngredient(.brandies(.cognacVSOP), value: 1),
                       CocktailIngredient(.wines(.champagne) , value: 2)]

var french75MnHBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the Champagne, into a tin and shake with ice"),
                                            Instruction(step: 2, method: "Strain over into a Champagne flute and top with Champagne"),
                                            Instruction(step: 3, method: "Give a gentle stir")])

var french75MnHTags   = Tags(flavors: [.lemon],
                            profiles: [.citrusy, .floral, .effervescent, .light, .fruity],
                            styles: [.shaken, .fizz])

