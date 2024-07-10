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
                         author: Author(person: AuthorNames.tjSiegal.rawValue , place: AuthorPlaces.milkAndHoney.rawValue, year: "Early 2000s"),
                         spec: goldRushSpec,
                         tags: goldRushTags,
                         collection: .milkAndHoney)

var goldRushSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                     OldCocktailIngredient(.syrups(.honeySyrup), value: 0.75, prep: PrepBible.honeySyrup),
                     OldCocktailIngredient(.whiskies(.bourbonAny) , value: 2)]


var goldRushTags   = Tags(profiles: [.citrusy, .refreshing, .light],
                          styles: [.shaken, .sour])

