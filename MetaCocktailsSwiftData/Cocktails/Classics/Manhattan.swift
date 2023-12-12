//
//  Manhattan.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/20/23.
//

import SwiftUI



var manhattan = Cocktail(cocktailName: "Manhattan",
                         glasswareType: .stemmedGlassware,
                         garnish: [.maraschinoCherry, .lemonExpression],
                         author: "Most likely the Manhattan Club (1874)",
                         spec: manhattanSpec,
                         tags: manhattanTags)


var manhattanSpec     =  [CocktailIngredient(.angosturaBitters, value: 2, unit: .dash),
                          CocktailIngredient(.sweetVermouth, value: 1),
                          CocktailIngredient(.straightRyeOrBourbon, value: 2)]


var manhattanTags     = Tags(profiles: [.spiritForward],
                             textures: [.rich],
                             styles: [.manhattan, .stirred],
                             bitters: [.angosturaBitters],
                             fortifiedWine: [.sweetVermouth],
                             whiskies: [.ryeWhiskey, .bourbon, .straightRyeOrBourbon])
                        
