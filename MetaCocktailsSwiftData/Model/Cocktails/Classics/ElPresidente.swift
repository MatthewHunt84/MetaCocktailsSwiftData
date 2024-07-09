////
////  ElPresidente.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/10/23.
////

import SwiftUI


var elPresidente  = Cocktail(cocktailName: "El Presidente",
                             glasswareType: .coupe,
                             garnish: [.orangePeel, .maraschinoCherry],
                             ice: nil,
                             author: Author(person: AuthorNames.constante.rawValue, place: "Cuba", year: "1910s"),
                             spec: elPresidenteSpec,
                             buildOrder: nil,
                             tags: elPresidenteTags,
                             variation: .elPresidente,
                             collection: .originals,
                             titleCocktail: true)

var elPresidenteSpec  = [CocktailIngredient(.rums(.rumWhite), value: 1.5),
                         CocktailIngredient(.fortifiedWines(.blancVermouth), value: 1.5),
                         CocktailIngredient(.liqueurs(.orangeCuracao) , value: 1, unit: .teaspoon),
                         CocktailIngredient(.syrups(.grenadine), value: 0.5, unit: .teaspoon)]

var elPresidenteTags  = Tags(flavors: [.orange, .pomegranate],
                             profiles: [.aromatic, .fruity, .spiritForward],
                             styles: [.martini, .stirred])
                             
