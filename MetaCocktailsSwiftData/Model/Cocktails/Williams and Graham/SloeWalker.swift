//
//  SloeWalker.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation


var sloeWalker = Cocktail(cocktailName: "Sloe Walker",
                          glasswareType: .coupe,
                          garnish: [.grapefruitPeel],
                          ice: nil,
                          author:Author(place: AuthorPlaces.williamsAndGraham.rawValue),
                          spec: sloeWalkerSpec,
                          buildOrder: nil,
                          tags: sloeWalkerTags)

var sloeWalkerSpec  = [CocktailIngredient(.amari(.amargoVallet), value: 0.25),
                       CocktailIngredient(.liqueurs(.plymouthSloeGin), value: 0.25),
                       CocktailIngredient(.fortifiedWines(.cocchiAmericano), value: 1.5),
                       CocktailIngredient(.liqueurs(.dolinGenepy), value: 0.75)]

var sloeWalkerTags = Tags(profiles: [.herbal, .delicate, .complex],
                          styles: [.stirred, .martini])
