//
//  SomethingBitter.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation


var somethingBitter  =  Cocktail(cocktailName: "Something Bitter This Way Comes",
                                 glasswareType: .doubleOld,
                                 garnish: [.orangePeel],
                                 ice: .bigRock,
                                 author:Author(person: "Whitney Allen & \(AuthorNames.valarieAlvarado.rawValue)", place: AuthorPlaces.williamsAndGraham.rawValue, year: "2018"),
                                 spec: somethingBitterSpec,
                                 buildOrder: nil,
                                 tags: somethingBitterTags,
                                 collection: .williamsAndGraham)

var somethingBitterSpec = [CocktailIngredient(.bitters(.chocolateMole), value: 8, unit: .drops),
                           CocktailIngredient(.liqueurs(.clementCreole), value: 0.25),
                           CocktailIngredient(.amari(.fernetVallet), value: 0.25),
                           CocktailIngredient(.amari(.campari), value: 0.5),
                           CocktailIngredient(.brandies(.pFAmber), value: 1.5)]

var somethingBitterTags = Tags(profiles: [.rich, .bittersweet, .punchy, .spiritForward],
                               styles: [.negroni, .stirred])
