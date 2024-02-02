//
//  TheSeventhSon.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation


var theSeventhSon  =  Cocktail(cocktailName: "The Seventh Son",
                               glasswareType: .doubleOld,
                               garnish: [.grapefruitPeel],
                               ice: .bigRock,
                               author:Author(person: AuthorNames.seanKenyon.rawValue,
                                             place: "5280, The Cookbook. Pg. 140", year: "2014"),
                               spec: theSeventhSonSpec,
                               buildOrder: nil,
                               tags: theSeventhSonTags)

var theSeventhSonSpec = [CocktailIngredient(.bitters(.grapefruitBitters), value: 2, unit: .dashes),
                         CocktailIngredient(.amari(.amaroMontenegro), value: 0.5),
                         CocktailIngredient(.fortifiedWines(.dolinBlanc), value: 1),
                         CocktailIngredient(.agaves(.tequilaSieteLeguasBlanco), value: 1.5)]

var theSeventhSonTags = Tags(profiles: [.rich, .bittersweet, .punchy, .spiritForward, .elegant],
                             styles: [.negroni, .stirred])
