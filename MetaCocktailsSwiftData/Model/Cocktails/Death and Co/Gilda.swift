//
//  Gilda.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var gilda = Cocktail(cocktailName: "Gilda",
                       glasswareType: .coupe,
                       garnish: [.limeWheel],
                       ice: nil,
                       author: Author(person: "Brian Miller",
                                      place: AuthorPlaces.deathAndCo.rawValue,
                                      year: "2009"),
                       spec: gildaSpec,
                       tags: gildaTags)

var gildaSpec  = [CocktailIngredient(.juices(.lime), value: 0.5),
                    CocktailIngredient(.syrups(.cinnamonSyrup), value: 0.5),
                    CocktailIngredient(.juices(.pineappleJuice), value: 0.5),
                    CocktailIngredient(.agaves(.tequilaBlanco), value: 2)]


var gildaTags = Tags(profiles: [.refreshing, .fruity, .light],
                       styles: [.sour, .shaken])
                       
