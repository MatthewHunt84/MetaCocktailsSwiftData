//
//  Bamboo.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/8/23.
//

import SwiftUI

var Bamboo = Cocktail(cocktailName: "Bamboo",
                      imageAsset: nil,
                      glasswareType: Glassware.coupe,
                      garnish: [.orangeOrLemon],
                      ice: nil,
                      author: "Louis Eppinger",
                      spec: bambooSpec,
                      buildOrder: nil,
                      tags: bambooTags)


var bambooSpec = [CocktailIngredient(ingredient: .amontillado, value: 1.5, unit: .fluidOunces), 
                  CocktailIngredient(ingredient: .dryVermouth, value: 1.5, unit: .fluidOunces),
                  CocktailIngredient(ingredient: .orangeBitters, value: 2, unit: .dash)]

var bambooTags = Tags(flavors: [.dry],
                      profiles: [.aromatic, .floral, .fruity],
                      textures: [.thin, .light],
                      styles: [.martini, .stirred],
                      bases: [.dryVermouth, .amontillado])

