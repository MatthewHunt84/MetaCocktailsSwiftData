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
                     tags: gildaTags,
                     collection: .deathAndCo)

var gildaSpec  = [OldCocktailIngredient(.juices(.lime), value: 0.5),
                  OldCocktailIngredient(.syrups(.cinnamonSyrup), value: 0.5, prep: PrepBible.cinnamonSyrup),
                  OldCocktailIngredient(.juices(.pineappleJuice), value: 0.5),
                  OldCocktailIngredient(.agaves(.tequilaBlanco), value: 2)]


var gildaTags = Tags(profiles: [.refreshing, .fruity, .light],
                     styles: [.sour, .shaken])

