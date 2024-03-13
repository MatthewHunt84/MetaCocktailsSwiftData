//
//  SuttersMill.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/13/24.
//

import Foundation


var suttersMill = Cocktail(cocktailName: "Sutter's Mill",
                           glasswareType: Glassware.doubleOld,
                           garnish: [.pineappleWedge, .cinnamon],
                           ice: .bigRock,
                           author:Author(person: AuthorNames.gilBouhana.rawValue,
                                         place: AuthorPlaces.milkAndHoney.rawValue, year: "Early 2000s"),
                           spec: suttersMillSpec,
                           buildOrder: nil,
                           tags: suttersMillTags,
                           variation: nil ,
                           collection: .milkAndHoney,
                           titleCocktail: false)

var suttersMillSpec = [CocktailIngredient(.fruit(.pineapple), value:1, unit: .muddled),
                       CocktailIngredient(.juices(.lemon), value: 0.75, unit: .fluidOunces),
                       CocktailIngredient(.syrups(.honeySyrup), value: 0.75, prep: PrepBible.honeySyrup),
                       CocktailIngredient(.whiskies(.bourbonAny), value: 2)]

var suttersMillTags = Tags(profiles: [.citrusy, .refreshing, .fruity],
                           styles: [.sour, .shaken])

