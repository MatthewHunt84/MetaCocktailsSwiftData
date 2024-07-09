////
////  CominUpRoses.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/24/23.
////

import SwiftUI

var cominUpRoses = Cocktail(cocktailName: "Comin' Up Roses",
                            glasswareType: .stemmedGlassware,
                            garnish: [.rosePetals],
                            ice: nil,
                            author:Author(person: AuthorNames.jamesMenkal.rawValue,
                                          place: AuthorPlaces.williamsAndGraham.rawValue, year: "Winter, 2021"),
                            spec: cominUpRosesSpec,
                            buildOrder: nil,
                            tags: cominUpRosesTags,
                            collection: .williamsAndGraham)

var cominUpRosesSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.5),
                         OldCocktailIngredient(.syrups(.demSyrupOneToOne), value: 0.5),
                         OldCocktailIngredient(.amari(.amaroMontenegro), value: 1.5),
                         OldCocktailIngredient(.whiskies(.bourbon120), value: 0.75)]

var cominUpRosesTags = Tags(profiles: [.herbal, .punchy, .floral, .citrusy],
                            styles: [.sour, .shaken])
