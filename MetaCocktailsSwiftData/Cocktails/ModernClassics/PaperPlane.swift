//
//  PaperPlane.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 9/25/23.
//

import SwiftUI

var paperPlane = Cocktail(cocktailName: "Paper Plane",
                          glasswareType: Glassware.coupe,
                          garnish: [.noGarnish],
                          author: "Sasha Petraske, Sam Ross",
                          spec: paperPlaneSpec,
                          buildOrder: nil,
                          tags: paperPlaneTags)

var paperPlaneSpec = [CocktailIngredient(.bourbon , value: 0.75, unit: .fluidOunces),
                      CocktailIngredient(.amaroNonino, value: 0.75, unit: .fluidOunces),
                      CocktailIngredient(.aperol, value: 0.75, unit: .fluidOunces),
                      CocktailIngredient(.lemon, value: 0.75, unit: .fluidOunces)]

var paperPlaneTags =  Tags(flavors: [.lemon, .orange, .rhubarb, .grapefruit, .whiskey, .bakingSpices], 
                           profiles: [.aromatic, .fruity, .tart],
                           textures: [.light],
                           styles: [.sour, .shaken],
                           bases: [.bourbon])
