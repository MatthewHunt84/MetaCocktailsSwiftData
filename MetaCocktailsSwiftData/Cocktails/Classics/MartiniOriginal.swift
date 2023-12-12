//
//  MartiniOriginal.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/20/23.
//

import SwiftUI



var martini   = Cocktail(cocktailName: "Martini",
                         glasswareType: .martini,
                         garnish: [.lemonPeel],
                         spec: martiniSpec,
                         tags: martiniTags)
        

var martiniSpec     =  [CocktailIngredient(.orangeBitters, value: 2, unit: .dash),
                        CocktailIngredient(.dryVermouth, value: 1.5),
                        CocktailIngredient(.gin, value: 1.5)]


var martiniTags     = Tags(profiles: [.spiritForward],
                             textures: [.rich],
                           styles: [.martini, .stirred],
                           bitters: [.orangeBitters],
                           fortifiedWine: [.dryVermouth],
                           gin: [.gin, .ginLondonDry],
                           vodka: [.vodka])
                          
