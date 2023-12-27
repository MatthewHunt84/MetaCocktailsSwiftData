////
////  DivisionBell.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////

import SwiftUI

var divisionBell = Cocktail(cocktailName: "Division Bell",
                            glasswareType: .stemmedGlassware,
                            garnish: [.grapefruitExpression],
                            ice: nil,
                            author: "Phil Ward",
                            spec: divisionBellSpec,
                            tags: divisionBellTags)

var divisionBellSpec  = [CocktailIngredient(.juices(.lime), value: 0.75),
                         CocktailIngredient(.agaves(.mezcalSmokey), value: 1),
                         CocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.5),
                         CocktailIngredient(.amari(.aperol), value: 0.75)]

var divisionBellTags = Tags(textures: [.light],
                            styles: [.sour, .shaken])
                           
