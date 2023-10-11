//
//  PaperPlane.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 9/25/23.
//

import SwiftUI

var paperPlane = Cocktail(name: "Paper Plane",
                          imageName: Image(.emptyCocktail),
                          background: Color.brandPrimaryRed,
                          glasswareType: Glassware.coupe,
                          garnish: [GarnishCatalog.noGarnish.asset],
                          author: "Sasha Petraske, Sam Ross",
                          spec: paperPlaneSpec,
                          buildOrder: nil,
                          tags: paperPlaneTags)

var paperPlaneSpec = [CocktailIngredient(name: .bourbon , value: 0.75, unit: .fluidOunces),
                      CocktailIngredient(name: .amaroNonino, value: 0.75, unit: .fluidOunces),
                      CocktailIngredient(name: .aperol, value: 0.75, unit: .fluidOunces),
                      CocktailIngredient(name: .lemon, value: 0.75, unit: .fluidOunces)]

var paperPlaneTags =  Tags(flavors: [.lemon, .orange, .rhubarb, .grapefruit, .whiskey, .bakingSpices],
                           textures: [.light],
                           styles: [.sour, .shaken],
                           baseComponents: [.bourbon])
