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
                         author: Author(person: AuthorNames.chadLarson.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue),
                         spec: macheteSpec,
                         buildOrder: nil,
                         tags: macheteTags,
                         collection: .williamsAndGraham)

var macheteSpec = [OldCocktailIngredient(.bitters(.hellfireBitters), value: 12, unit: .drops),
                   OldCocktailIngredient(.amari(.fernetBranca), value: 0.5),
                   OldCocktailIngredient(.liqueurs(.clementCreole), value: 0.5),
                   OldCocktailIngredient(.fortifiedWines(.lilletBlanc), value: 1),
                   OldCocktailIngredient(.agaves(.mezcalDelMagueyVida), value: 1)]

var macheteTags = Tags(flavors: [.grapefruit],
                       profiles: [.rich, .bittersweet, .spicy, .spiritForward],
                       styles: [.negroni, .stirred])
