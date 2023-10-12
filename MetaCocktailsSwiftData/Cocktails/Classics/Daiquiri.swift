//
//  Daiquiri.swift
//  MetaCocktails
//
//  Created by Matt Hunt on 9/1/23.
//


import SwiftUI

var daiquiri = Cocktail(name: "Daiquiri",
                        imageName: "daiquiri-1",
                        glasswareType: .coupe,
                        garnish: [GarnishCatalog.limeWheel.asset], 
                        ice: nil,
                        spec: daiquiriSpec,
                        tags: tags)

var daiquiriSpec = [CocktailIngredient(name: .lime, value: 0.75, unit: .fluidOunces),
                    CocktailIngredient(name: .simple, value: 0.75, unit: .fluidOunces),
                    CocktailIngredient(name: .whiteRum, value: 2, unit: .fluidOunces)]

var tags = Tags(flavors: [.lime],
                profiles: [.citrusy],
                textures: [.light],
                styles: [.sour, .shaken],
                baseComponents: [.rum])


