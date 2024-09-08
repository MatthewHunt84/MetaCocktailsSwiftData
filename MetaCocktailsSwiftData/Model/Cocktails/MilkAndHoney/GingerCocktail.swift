//
//  GingerCocktail.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/12/24.
//

import Foundation


var gingerCocktail = Cocktail(cocktailName: "Ginger Cocktail",
                              glasswareType: .coupe,
                              garnish: [.candiedGinger],
                              ice: nil,
                              author:Author(person: AuthorNames.sashaPetraske.rawValue ,place: AuthorPlaces.milkAndHoney.rawValue , year: "Early 2000s"),
                              spec: gingerCocktailSpec,
                              buildOrder: nil,
                              tags: gingerCocktailTags,
                              collection: .milkAndHoney)

var gingerCocktailSpec     =  [OldCocktailIngredient(.juices(.lime), value: 0.5),
                               OldCocktailIngredient(.syrups(.gingerSyrup), value: 0.75, prep: PrepBible.gingerSyrup),
                               OldCocktailIngredient(.gins(.ginAny), value: 2)]

var gingerCocktailTags     = Tags(profiles: [.citrusy, .tart],
                                  styles: [.sour, .shaken])
