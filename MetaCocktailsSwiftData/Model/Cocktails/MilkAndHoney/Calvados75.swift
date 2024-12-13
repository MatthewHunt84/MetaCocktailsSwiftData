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
                           collection: .milkAndHoney)

var calvados75Spec  = [OldCocktailIngredient(.juices(.lemon), value: 0.5),
                       OldCocktailIngredient(.syrups(.simple), value: 0.5, prep: PrepBible.simpleSyrupPrep),
                       OldCocktailIngredient(.brandies(.boulardCalvados), value: 1),
                       OldCocktailIngredient(.wines(.champagne) , value: 2)]



var calvados75Tags   = Tags(flavors: [.lemon],
                            profiles: [.citrusy, .floral, .effervescent, .light, .fruity],
                            styles: [.collins, .shaken, .fizz])

