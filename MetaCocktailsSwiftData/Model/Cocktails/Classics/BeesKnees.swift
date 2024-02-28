//
//  BeesKnees.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var beesKnees  = Cocktail(cocktailName: "Bee's Knees",
                          glasswareType: .coupe,
                          garnish: [.lemonPeel],
                          author: Author(person: "The Standard Union", place: "Brooklyn, NY", year: "April 23, 1929"),
                          spec: beesKneesSpec,
                          tags: beesKneesTags)

var beesKneesSpec  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                      CocktailIngredient(.syrups(.honeySyrup), value: 0.75, prep: PrepBibleViewModel().honeySyrup),
                      CocktailIngredient(.gins(.fordsGin) , value: 2)]


var beesKneesTags   = Tags(profiles: [.citrusy, .refreshing, .light],
                           styles: [.shaken, .sour])

