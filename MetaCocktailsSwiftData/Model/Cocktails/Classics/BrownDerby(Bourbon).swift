//
//  BrownDerby(Bourbon).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

let brownDerbyBourbon = Cocktail(cocktailName: "Brown Derby",
                                 glasswareType: .stemmedGlassware,
                                 author: Author(place: "Hollywood(maybe)", year: "1930s"),
                                 spec: brownDerbyBourbonSpec,
                                 tags: brownDerbyBourbonTags,
                                 variation: .brownDerby,
                                 collection: .originals,
                                 titleCocktail: true)

var brownDerbyBourbonSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.whiskies(.bourbonAny), value: 2),
                                                   OldCocktailIngredient(.juices(.grapefruit), value: 1),
                                                   OldCocktailIngredient(.syrups(.honeySyrup), value: 0.5, prep: PrepBible.honeySyrup)]

var brownDerbyBourbonTags = Tags(profiles: [.citrusy, .refreshing, .light],
                                 styles: [.sour, .shaken])


