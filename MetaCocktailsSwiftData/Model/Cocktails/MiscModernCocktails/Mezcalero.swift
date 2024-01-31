//
//  Mezcalero.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var mezcalero  =  Cocktail(cocktailName: "Mezcalero",
                         glasswareType: .doubleOld,
                         garnish: [.grapefruitPeel],
                         ice: .bigRock,
                         author: Author(person: "John Lermayor", place: "Sweet Liberty. Miami, Florida"),
                         spec: mezcaleroSpec,
                         buildOrder: nil,
                         tags: mezcaleroTags)

var mezcaleroSpec = [CocktailIngredient(.amari(.aperol), value: 1),
                        CocktailIngredient(.fortifiedWines(.dolinBlanc), value: 1),
                        CocktailIngredient(.agaves(.mezcalDelMagueyVida), value: 1)]

var mezcaleroTags = Tags(profiles: [.bittersweet, .smokey, .fruity],
                            styles: [.negroni, .shaken])
