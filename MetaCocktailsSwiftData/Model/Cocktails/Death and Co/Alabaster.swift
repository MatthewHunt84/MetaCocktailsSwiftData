//
//  Alabaster.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/17/24.
//

import Foundation

var alabaster = Cocktail(cocktailName: "Alabaster",
                         glasswareType: .nickAndNora,
                         author:Author(person: AuthorNames.jakePowell.rawValue,
                                       place: AuthorPlaces.deathAndCo.rawValue,
                                       year: "Denver, 2022"),
                         spec: alabasterSpec,
                         tags: alabasterTags,
                         collection: .deathAndCo)

var alabasterSpec  = [OldCocktailIngredient(.juices(.lime), value: 0.75),
                      OldCocktailIngredient(.liqueurs(.charaeu), value: 0.75),
                      OldCocktailIngredient(.liqueurs(.velvetFalernum), value: 0.75),
                      OldCocktailIngredient(.rums(.probitasRum), value: 0.75)]

var alabasterTags = Tags(profiles: [.light, .dry, .punchy],
                         styles: [.sour, .daisy, .shaken])

