//
//  Machete.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation


var machete  =  Cocktail(cocktailName: "Machete",
                         glasswareType: Glassware.doubleOld,
                         garnish: [.grapefruitPeel],
                         ice: .bigRock,
                         author: Author(place: AuthorPlaces.williamsAndGraham.rawValue),
                         spec: macheteSpec,
                         buildOrder: nil,
                         tags: macheteTags)

var macheteSpec = [CocktailIngredient(.bitters(.hellfireBitters), value: 12, unit: .drops),
                   CocktailIngredient(.amari(.fernetBranca), value: 0.5),
                   CocktailIngredient(.liqueurs(.clementCreole), value: 0.5),
                   CocktailIngredient(.fortifiedWines(.lilletBlanc), value: 1),
                   CocktailIngredient(.agaves(.mezcalDelMagueyVida), value: 1)]

var macheteTags = Tags(profiles: [.rich, .bittersweet, .spicy],
                       styles: [.negroni, .stirred])
