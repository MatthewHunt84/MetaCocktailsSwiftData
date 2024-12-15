//
//  StarfishAndCoffee.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt 12/15/24.
//

import Foundation

var starfishAndCoffee = Cocktail(cocktailName: "Starfish and Coffee",
                                 glasswareType: .doubleOld,
                                 ice: .bigRock,
                                 author:Author(person: AuthorNames.tysonBuhler.rawValue,
                                               place: AuthorPlaces.deathAndCo.rawValue,
                                               year: "2016"),
                                 spec: starfishAndCoffeeSpec,
                                 buildOrder: starfishAndCoffeeBuild,
                                 tags: Tags())

var starfishAndCoffeeSpec = [OldCocktailIngredient(.rums(.goslingsBlackSeal), value: 1),
                             OldCocktailIngredient(.fortifiedWines(.puntEMes), value: 1),
                             OldCocktailIngredient(.otherNonAlc(.coldBrew), value: 1),
                             OldCocktailIngredient(.syrups(.vanilla), value: 0.25, prep: PrepBible.vanillaSyrup),
                             OldCocktailIngredient(.soda(.feverTreeAromatic), value: 3)]

