////
////  Bamboo.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/8/23.
////
//
import SwiftUI

var bamboo = Cocktail(cocktailName: "Bamboo",
                      imageAsset: nil,
                      glasswareType: Glassware.coupe,
                      garnish: [.orangeOrLemon],
                      ice: nil,
                      author: Author(person: "Louis Eppinger", place: "Grand Hotel in Yokohama, Japan", year: "1908"),
                      spec: bambooSpec,
                      buildOrder: nil,
                      tags: bambooTags,
                      variation: .bamboo,
                      collection: .originals,
                      titleCocktail: true)

var bambooSpec = [OldCocktailIngredient(.fortifiedWines(.amontillado), value: 1.5),
                  OldCocktailIngredient(.fortifiedWines(.dryVermouthAny), value: 1.5),
                  OldCocktailIngredient(.bitters(.orangeBitters), value: 2, unit: .dashes)]

var bambooTags = Tags(flavors: [.lemon, .orange],
                      profiles: [.dry, .light, .fruity],
                      styles: [.martini, .stirred])
                   

