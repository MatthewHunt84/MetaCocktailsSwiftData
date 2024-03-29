//
//  PipeDream.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation



var pipeDream  =  Cocktail(cocktailName: "Pipe Dream",
                           glasswareType: .martini,
                           garnish: [.lemonExpression],
                           ice: nil,
                           author:Author(person: "Alexander Hammes",
                                         place: AuthorPlaces.williamsAndGraham.rawValue, year: "Winter, 2021"),
                           spec: pipeDreamSpec,
                           buildOrder: nil,
                           tags: pipeDreamTags,
                           collection: .williamsAndGraham)

var pipeDreamSpec = [CocktailIngredient(.seasoning(.saline), value: 2, unit: .drops),
                     CocktailIngredient(.otherAlcohol(.serranoTincture), value: 1, unit: .dashes),
                     CocktailIngredient(.bitters(.chocolateMole), value: 2, unit: .dashes),
                     CocktailIngredient(.liqueurs(.damiana), value: 1.5),
                     CocktailIngredient(.agaves(.mezcalDelMagueyVida), value: 1.5)]

var pipeDreamTags = Tags(profiles: [.rich, .bittersweet, .punchy],
                         styles: [.martini, .stirred])
