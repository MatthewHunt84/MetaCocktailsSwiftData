////
////  PaperPlane.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 9/25/23.
////

import SwiftUI

var paperPlane = Cocktail(cocktailName: "Paper Plane",
                          glasswareType: Glassware.coupe,
                          garnish: [.noGarnish],
                          author:Author(person: AuthorNames.samRoss.rawValue, place: AuthorPlaces.theVioletHour.rawValue, year: "2008"),
                          spec: paperPlaneSpec,
                          buildOrder: nil,
                          tags: paperPlaneTags,
                          variation: nil,
                          collection: .milkAndHoney)

var paperPlaneSpec = [OldCocktailIngredient(.whiskies(.bourbonAny) , value: 0.75),
                      OldCocktailIngredient(.amari(.amaroNonino), value: 0.75),
                      OldCocktailIngredient(.amari(.aperol), value: 0.75),
                      OldCocktailIngredient(.juices(.lemon), value: 0.75)]

var paperPlaneTags =  Tags(flavors: [.lemon, .orange, .rhubarb, .grapefruit, .bakingSpices], 
                           profiles: [.citrusy, .tart, .light, .dry],
                           styles: [.daisy, .shaken, .sour])
                           
