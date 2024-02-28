//
//  BrownDerby(Bourbon).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

let brownDerbyBourbon = Cocktail(cocktailName: "Brown Derby(1930s)",
                                 glasswareType: .stemmedGlassware,
                                 author: Author(place: "Hollywood(maybe)", year: "1930s"),
                                 spec: brownDerbyBourbonSpec,
                                 tags: brownDerbyBourbonTags,
                                 variation: .brownDerby)

var brownDerbyBourbonSpec: [CocktailIngredient] = [CocktailIngredient(.whiskies(.bourbonAny), value: 2),
                                                   CocktailIngredient(.juices(.grapefruit), value: 1),
                                                   CocktailIngredient(.syrups(.honeySyrup), value: 0.5, prep: PrepBibleViewModel().honeySyrup)]

var brownDerbyBourbonTags = Tags(profiles: [.citrusy, .refreshing, .light],
                                 styles: [.sour, .shaken])


