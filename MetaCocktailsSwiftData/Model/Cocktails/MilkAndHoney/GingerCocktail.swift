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

var gingerCocktailSpec     =  [CocktailIngredient(.juices(.lime), value: 0.5),
                               CocktailIngredient(.syrups(.gingerSyrup), value: 0.75, prep: PrepBible.gingerSyrup),
                               CocktailIngredient(.gins(.ginAny), value: 2)]

var gingerCocktailTags     = Tags(profiles: [.citrusy, .tart, .sharp],
                                  styles: [.sour, .shaken])
