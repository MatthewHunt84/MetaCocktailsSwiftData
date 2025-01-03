////
////  Negroni.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/6/23.
////

import SwiftUI

var negroni  =  Cocktail(cocktailName: "Negroni",
                         glasswareType: Glassware.doubleOld,
                         garnish: [.orangePeel],
                         ice: .bigRock,
                         author: Author(person: AuthorNames.countNegroni.rawValue, place: "Caffè Casoni (now Caffè Giacosa)", year: "Late 1910s"),
                         spec: negroniSpec,
                         buildOrder: nil,
                         tags: negroniTags,
                         collection: .originals)

var negroniSpec = [OldCocktailIngredient(.gins(.ginAny), value: 1),
                   OldCocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1),
                   OldCocktailIngredient(.amari(.campari), value: 1)]

var negroniTags = Tags(flavors: [.orange],
                       profiles: [.bittersweet, .spiritForward, .rich, .bitter],
                       styles: [.negroni, .stirred])


