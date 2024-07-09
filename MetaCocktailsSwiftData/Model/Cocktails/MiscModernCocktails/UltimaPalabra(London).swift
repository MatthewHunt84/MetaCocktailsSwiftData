//
//  UltimaPalabra(London).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var ultimaPalabraLondon = Cocktail(cocktailName: "Ultima Palabra(London Version)",
                                   glasswareType: .stemmedGlassware,
                                   garnish: [.thyme],
                                   ice: nil,
                                   author: Author(person: "Simone de Luca", place: "High Road House Club, London"),
                                   spec: ultimaPalabraLondonSpec,
                                   tags: ultimaPalabraLondonTags,
                                   variation: .ultimaPalabra)

var ultimaPalabraLondonSpec  = [OldCocktailIngredient(.juices(.lime), value: 0.75),
                                OldCocktailIngredient(.juices(.pineappleJuice), value: 0.75),
                                OldCocktailIngredient(.agaves(.mezcalSmokeyAny), value: 0.75),
                                OldCocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.75),
                                OldCocktailIngredient(.liqueurs(.greenChartreuse), value: 0.75)]

var ultimaPalabraLondonTags = Tags(profiles: [.herbal, .citrusy, .fruity],
                                   styles: [.daisy, .shaken, .sour])

