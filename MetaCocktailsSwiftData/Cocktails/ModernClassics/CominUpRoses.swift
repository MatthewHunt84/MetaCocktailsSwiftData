////
////  CominUpRoses.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/24/23.
////

import SwiftUI

var cominUpRoses = Cocktail(cocktailName: "Comin' Up Roses",
                            glasswareType: .stemmedGlassware,
                            garnish: [.rosePedals],
                            ice: nil,
                            author: "James Menkal(2021ish)",
                            spec: cominUpRosesSpec,
                            buildOrder: nil,
                            tags: cominUpRosesTags)

var cominUpRosesSpec  = [CocktailIngredient(.juices(.lemon), value: 0.5),
                         CocktailIngredient(.syrups(.demSyrupOneToOne), value: 0.5),
                         CocktailIngredient(.amari(.amaroMontenegro), value: 1.5),
                         CocktailIngredient(.whiskies(.bourbon120), value: 0.75)]

var cominUpRosesTags = Tags(textures: [.light],
                            styles: [.sour, .shaken])
