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
                               tags: kittenWithAWhipTags,
                               collection: .williamsAndGraham)

let kittenWithAWhipSpec = [OldCocktailIngredient(.liqueurs(.tempusFugitKina), value: 3, unit: .drops),
                           OldCocktailIngredient(.amari(.cynar), value: 0.5),
                           OldCocktailIngredient(.liqueurs(.amaretto), value: 0.5),
                           OldCocktailIngredient(.gins(.hendricks), value: 1.5)]


let kittenWithAWhipTags = Tags(profiles: [.nutty, .punchy, .rich, .bittersweet],
                               styles: [.martini, .stirred])



