//
//  Calvados75.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/1/24.
//

import Foundation

var calvados75  = Cocktail(cocktailName: "Calvados 75",
                           glasswareType: .collins,
                           garnish: nil,
                           ice: .crackedIce,
                           author: sashaPetraske,
                           spec: calvados75Spec,
                           buildOrder: calvados75Build,
                           tags: calvados75Tags,
                           variation: .french75,
                           collection: .originals)

var calvados75Spec  = [CocktailIngredient(.juices(.lemon), value: 0.5),
                       CocktailIngredient(.syrups(.simple), value: 0.5),
                       CocktailIngredient(.brandies(.boulardCalvados), value: 1),
                       CocktailIngredient(.wines(.champagne) , value: 2)]

var calvados75Build  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the Champagne, into a tin and shake with ice"),
                                            Instruction(step: 2, method: "strain over cracked ice and top with Champagne"),
                                            Instruction(step: 3, method: "Give a gentle stir")])

var calvados75Tags   = Tags(flavors: [.lemon],
                            profiles: [.citrusy, .floral, .effervescent, .light, .fruity],
                            styles: [.collins, .shaken, .fizz])

