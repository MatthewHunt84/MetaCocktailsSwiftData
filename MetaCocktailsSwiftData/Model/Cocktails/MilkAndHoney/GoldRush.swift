//
//  GoldRush.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/27/24.
//

import Foundation

var goldRush  = Cocktail(cocktailName: "Gold Rush",
                         glasswareType: .doubleOld ,
                         garnish: [.lemonPeel],
                         ice: .bigRock,
                         author: Author(person: "T.J. Siegal(Sasha's best friend)" , place: AuthorPlaces.milkAndHoney.rawValue, year: "Early 2000s"),
                         spec: goldRushSpec,
                         tags: goldRushTags)

var goldRushSpec  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                     CocktailIngredient(.syrups(.honeySyrup), value: 0.75, prep: PrepBibleViewModel().honeySyrup),
                     CocktailIngredient(.whiskies(.bourbonAny) , value: 2)]


var goldRushTags   = Tags(profiles: [.citrusy, .refreshing, .light],
                          styles: [.shaken, .sour])

