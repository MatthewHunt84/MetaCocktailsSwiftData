//
//  Bamboo.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/8/23.
//

import SwiftUI

var Bamboo = Cocktail(name: "Bamboo",
                      imageName: Image(.emptyCocktail),
                      background: Color.brandPrimaryBlue,
                      glasswareType: Glassware.coupe,
                      garnish: [GarnishCatalog.orangeOrLemon.asset],
                      ice: nil,
                      author: "Louis Eppinger",
                      spec: bambooSpec,
                      buildOrder: nil,
                      tags: bambooTags)


var bambooSpec = [CocktailIngredient(name: .amontillado, value: 1.5, unit: .fluidOunces), CocktailIngredient(name: .dryVermouth, value: 1.5, unit: .fluidOunces), CocktailIngredient(name: .orangeBitters, value: 2, unit: .dash)]

var bambooTags = Tags(flavors: [.dry], textures: [.thin], styles: [.martini], baseComponents: [.dryVermouth, .amontillado])

