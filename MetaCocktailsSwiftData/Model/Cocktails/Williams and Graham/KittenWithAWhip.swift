//
//  KittenWithAWhip.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation


var kittenWithAWhip = Cocktail(cocktailName: "Kitten with a Whip",
                               imageAsset: nil,
                               glasswareType: .martini,
                               garnish: [.maraschinoCherry],
                               ice: nil,
                               author: justWnG,
                               spec: kittenWithAWhipSpec,
                               tags: kittenWithAWhipTags)

let kittenWithAWhipSpec = [CocktailIngredient(.liqueurs(.tempusFugitKina), value: 3, unit: .drops),
                           CocktailIngredient(.amari(.cynar), value: 0.5),
                           CocktailIngredient(.liqueurs(.amaretto), value: 0.5),
                           CocktailIngredient(.gins(.hendricks), value: 1.5)]


let kittenWithAWhipTags = Tags(profiles: [.nutty, .punchy, .rich, .bittersweet],
                               styles: [.martini, .stirred])



