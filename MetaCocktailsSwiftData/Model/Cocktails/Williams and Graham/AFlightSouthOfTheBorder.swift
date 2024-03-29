//
//  AFlightSouthOfTheBorder.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation

var aFlightSouthOfTheBorder = Cocktail(cocktailName: "A Flight South of the Border",
                                       imageAsset: nil,
                                       glasswareType: .doubleOld,
                                       garnish: [.dehydratedGrapefruitSlice],
                                       ice: .bigRock,
                                       author: Author(person: "Tom Lagae", place: AuthorPlaces.williamsAndGraham.rawValue, year: "2019"),
                                       spec: aFlightSouthOfTheBorderSpec,
                                       tags: aFlightSouthOfTheBorderTags,
                                       collection: .williamsAndGraham)

let aFlightSouthOfTheBorderSpec: [CocktailIngredient] = [CocktailIngredient(.herbs(.mint), value: 9, unit: .gentlyMuddled),
                                                         CocktailIngredient(.fruit(.grapefruitPeel), value: 2, unit: .none),
                                                         CocktailIngredient(.syrups(.honeySyrup), value: 0.75, prep: PrepBible.honeySyrup),
                                                         CocktailIngredient(.juices(.lemon), value: 0.75),
                                                         CocktailIngredient(.amari(.suze), value: 0.25),
                                                         CocktailIngredient(.liqueurs(.giffardPamplemousse), value: 0.5),
                                                         CocktailIngredient(.amari(.amaroNonino), value: 0.75),
                                                         CocktailIngredient(.agaves(.tequilaOchoBlanco), value: 0.75)]


let aFlightSouthOfTheBorderTags = Tags(profiles: [.refreshing, .complex, .fruity],
                                       styles: [.sour, .shaken, .tiki])

