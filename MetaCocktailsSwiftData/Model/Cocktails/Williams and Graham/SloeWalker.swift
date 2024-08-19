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
                          author:Author(person: AuthorNames.kennyRemster.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue),
                          spec: sloeWalkerSpec,
                          buildOrder: nil,
                          tags: sloeWalkerTags,
                          collection: .williamsAndGraham)

var sloeWalkerSpec  = [OldCocktailIngredient(.amari(.amargoVallet), value: 0.25),
                       OldCocktailIngredient(.liqueurs(.plymouthSloeGin), value: 0.25),
                       OldCocktailIngredient(.fortifiedWines(.cocchiAmericano), value: 1.5),
                       OldCocktailIngredient(.liqueurs(.dolinGenepy), value: 0.75)]

var sloeWalkerTags = Tags(flavors: [.grapefruit],
                          profiles: [.herbal, .complex],
                          styles: [.stirred, .martini])
