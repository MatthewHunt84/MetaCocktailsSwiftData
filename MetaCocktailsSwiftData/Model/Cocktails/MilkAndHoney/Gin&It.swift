//
//  Gin&It.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/29/24.
//

import Foundation

var ginAndIt  = Cocktail(cocktailName: "Gin & It (Milk & Honey)",
                         glasswareType: .coupe,
                         garnish: [.lemonPeel],
                         ice: nil,
                         author: Author(person: AuthorNames.rKFox.rawValue , place: AuthorPlaces.hoffmanBartendersGuide.rawValue, year: "1905"),
                         spec: ginAndItSpec,
                         tags: ginAndItTags,
                         collection: .milkAndHoney)

var ginAndItSpec  = [OldCocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1),
                     OldCocktailIngredient(.gins(.ginAny) , value: 2)]


var ginAndItTags   = Tags(profiles: [.spiritForward, .botanical],
                          styles: [.stirred, .martini])

var ginANdItBuild = Build(instructions: [Instruction(step: 1, method: "'It' is short for Italian vermouth, and the original recipe from the 1905 'Hoffman House Bartender's Guide: How to Open a Saloon and Make it Pay' calls for 2.5oz. gin and .5oz. sweet Italian vermouth. But, Sasha and I only ever drank it with a 2:1 gin-to-vermouth ratio. -Georgette Moger-Petraske")])
