////
////  Bamboo.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/8/23.
////
//
import SwiftUI

var bamboo = Cocktail(cocktailName: "Bamboo",
                      imageAsset: nil,
                      glasswareType: Glassware.coupe,
                      garnish: [.orangeOrLemon],
                      ice: nil,
                      author: Author(person: "Louis Eppinger"),
                      spec: bambooSpec,
                      buildOrder: nil,
                      tags: bambooTags)

var bambooSpec = [CocktailIngredient(.fortifiedWines(.amontillado), value: 1.5),
                  CocktailIngredient(.fortifiedWines(.dryVermouth), value: 1.5),
                  CocktailIngredient(.bitters(.orangeBitters), value: 2, unit: .dashes)]

var bambooTags = Tags(flavors: [.lemon],
                      profiles: nil,
                      textures: [.thin, .light],
                      styles: [.martini, .stirred])
                   

