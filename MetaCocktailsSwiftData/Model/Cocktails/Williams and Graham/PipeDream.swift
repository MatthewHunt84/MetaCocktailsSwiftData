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

var pipeDreamSpec = [OldCocktailIngredient(.seasoning(.saline), value: 2, unit: .drops, prep: PrepBible.fiveToOneSaline),
                     OldCocktailIngredient(.otherAlcohol(.serranoTincture), value: 1, unit: .dashes),
                     OldCocktailIngredient(.bitters(.chocolateMole), value: 2, unit: .dashes),
                     OldCocktailIngredient(.liqueurs(.damiana), value: 1.5),
                     OldCocktailIngredient(.agaves(.mezcalDelMagueyVida), value: 1.5)]

var pipeDreamTags = Tags(flavors: [.lemon],
                         profiles: [.rich, .bittersweet, .punchy],
                         styles: [.martini, .stirred])
