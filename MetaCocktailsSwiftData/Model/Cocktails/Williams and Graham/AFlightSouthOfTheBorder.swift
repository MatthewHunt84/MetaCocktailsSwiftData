//
//  AFlightSouthOfTheBorder.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation

var aFlightSouthOfTheBorder = Cocktail(cocktailName: "A Flight South of the Border",
                                       glasswareType: .doubleOld,
                                       garnish: [.dehydratedGrapefruitSlice],
                                       ice: .bigRock,
                                       author: Author(person: "Tom Lagae", place: AuthorPlaces.williamsAndGraham.rawValue, year: "2019"),
                                       spec: aFlightSouthOfTheBorderSpec,
                                       tags: aFlightSouthOfTheBorderTags,
                                       collection: .williamsAndGraham)

let aFlightSouthOfTheBorderSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.herbs(.mint), value: 9, unit: .gentlyMuddled),
                                                         OldCocktailIngredient(.fruit(.grapefruitPeel), value: 2, unit: .none),
                                                         OldCocktailIngredient(.syrups(.honeySyrup), value: 0.75, prep: PrepBible.honeySyrup),
                                                         OldCocktailIngredient(.juices(.lemon), value: 0.75),
                                                         OldCocktailIngredient(.amari(.suze), value: 0.25),
                                                         OldCocktailIngredient(.liqueurs(.giffardPamplemousse), value: 0.5),
                                                         OldCocktailIngredient(.amari(.amaroNonino), value: 0.75),
                                                         OldCocktailIngredient(.agaves(.tequilaOchoBlanco), value: 0.75)]


let aFlightSouthOfTheBorderTags = Tags(profiles: [.refreshing, .complex, .fruity],
                                       styles: [.sour, .shaken, .tiki])

