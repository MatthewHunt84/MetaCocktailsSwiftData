//
//  PeguClubSavoy.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/17/24.
//

import Foundation

var peguClubSavoy = Cocktail(cocktailName: "Pegu Club Cocktail (Savoy)",
                             glasswareType: .stemmedGlassware,
                             ice: nil,
                             author:Author(person: AuthorNames.harryCraddock.rawValue, place: AuthorPlaces.savoy.rawValue, year: "1930"),
                             spec: peguClubSavoySpec,
                             notes: peguClubSavoyNote,
                             tags: peguClubSavoyTags,
                             variation: .peguClub,
                             collection: .originals)

var peguClubSavoySpec  = [OldCocktailIngredient(.bitters(.orangeBitters), value: 1, unit: .dashes),
                          OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                          OldCocktailIngredient(.juices(.lime), value: 1, unit: .teaspoon),
                          OldCocktailIngredient(.liqueurs(.orangeCuracao), value: 1),
                          OldCocktailIngredient(.gins(.ginAny), value: 2)]

var peguClubSavoyTags = Tags(profiles: [.citrusy, .tart, .light, .restorative],
                             styles: [.daisy, .shaken, .sour])



