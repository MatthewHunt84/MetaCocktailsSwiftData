//
//  Gin&It.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/29/24.
//

import Foundation

var ginAndIt  = Cocktail(cocktailName: "Gin & It",
                         glasswareType: .coupe,
                         garnish: [.lemonPeel],
                         ice: nil,
                         author: Author(person: AuthorNames.sashaPetraske.rawValue , place: AuthorPlaces.milkAndHoney.rawValue, year: "Early 2000s"),
                         spec: ginAndItSpec,
                         notes: ginAndItNote,
                         tags: ginAndItTags,
                         collection: .milkAndHoney)

var ginAndItSpec  = [OldCocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1),
                     OldCocktailIngredient(.gins(.ginAny) , value: 2)]


var ginAndItTags   = Tags(flavors: [.lemon],
                          profiles: [.spiritForward, .botanical],
                          styles: [.stirred, .martini])



