//
//  SkyRocket.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/9/24.
//


import Foundation

var skyRocket  = Cocktail(cocktailName: "Sky Rocket", 
                          glasswareType: .collins,
                          ice: .koldDraft,
                          author: Author(place: "The Dead Rabbit. Manhattan, New York"),
                          spec: skyRocketSpec,
                          buildOrder: skyRocketBuild,
                          tags: skyRocketTags)

var skyRocketSpec  = [
                  OldCocktailIngredient(.gins(.aviation), value: 1.5),
                  OldCocktailIngredient(.syrups(.hibiscus), value: 0.75, prep: PrepBible.hibiscusSyrupPrep),
                  OldCocktailIngredient(.juices(.lime), value: 0.5),
                  OldCocktailIngredient(.amari(.becherovka), value: 0.5),
                  OldCocktailIngredient(.amari(.campari), value: 0.25),
                  OldCocktailIngredient(.otherNonAlc(.dryVanilla), value: 0.5)]


var skyRocketTags   = Tags(profiles: [.bittersweet], styles: [.collins, .shaken])


