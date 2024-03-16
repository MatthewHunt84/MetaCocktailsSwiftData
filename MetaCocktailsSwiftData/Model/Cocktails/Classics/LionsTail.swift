//
//  LionsTail.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/14/24.
//

import Foundation

var lionsTail  = Cocktail(cocktailName: "Lion's Tail",
                          glasswareType: .coupe,
                          garnish: nil ,
                          author: Author(person: AuthorNames.laClarke.rawValue , place: AuthorPlaces.cafeRoyalCocktialBook.rawValue, year: "1937"),
                          spec: lionsTailSpec,
                          buildOrder: nil,
                          tags: lionsTailTags,
                          collection: .originals,
                          titleCocktail: true)

var lionsTailSpec  = [CocktailIngredient(.juices(.lime), value: 0.5),
                      CocktailIngredient(.liqueurs(.allspiceDram), value: 0.5),
                      CocktailIngredient(.syrups(.gommeSyrup), value: 1, unit: .teaspoon, prep: PrepBible.gommeSyrup),
                      CocktailIngredient(.whiskies(.bourbonAny) , value: 2)]


var lionsTailTags   = Tags(profiles: [.citrusy, .tart, .punchy],
                           styles: [.shaken, .sour])
