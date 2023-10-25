//
//  CominUpRoses.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/24/23.
//

import SwiftUI

var cominUpRoses = Cocktail(cocktailName: "Last Word",
                            glasswareType: .stemmedGlassware,
                            garnish: [.rosePedals],
                            ice: nil,
                            author: "James Menkal(2021ish)",
                            spec: cominUpRosesSpec,
                            buildOrder: nil,
                            tags: cominUpRosesTags)

var cominUpRosesSpec  = [CocktailIngredient(.lemon, value: 0.5),
                     CocktailIngredient(.demSyrupOneToOne, value: 0.5),
                         CocktailIngredient(.amaroMontenegro, value: 1.5),
                     CocktailIngredient(.bourbon120Proof, value: 0.75)]


var cominUpRosesTags = Tags(textures: [.light],
                            styles: [.sour, .shaken],
                        bases: [.bourbon])
