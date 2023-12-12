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

var paperPlaneSpec = [CocktailIngredient(.bourbon , value: 0.75),
                      CocktailIngredient(.amaroNonino, value: 0.75),
                      CocktailIngredient(.aperol, value: 0.75),
                      CocktailIngredient(.lemon, value: 0.75)]

var paperPlaneTags =  Tags(flavors: [.lemon, .orange, .rhubarb, .grapefruit, .bakingSpices], 
                           profiles: [.citrusy, .tart],
                           textures: [.light],
                           styles: [.sour, .shaken],
                           amari: [.aperol, .amaroNonino],
                           whiskies: [.bourbon])
                           
