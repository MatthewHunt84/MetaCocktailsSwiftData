//
//  PeguClub.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/17/24.
//

import Foundation

var peguClub = Cocktail(cocktailName: "Pegu Club Cocktail",
                        glasswareType: .stemmedGlassware,
                        ice: nil,
                        author:Author(person: AuthorNames.harryMcElhone.rawValue, place: AuthorPlaces.abcOfMixingCocktails.rawValue, year: "1923"),
                        spec: peguClubSpec,
                        tags: peguClubTags,
                        variation: .peguClub,
                        collection: .originals, titleCocktail: true)

var peguClubSpec  = [OldCocktailIngredient(.bitters(.orangeBitters), value: 1, unit: .dashes),
                     OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                     OldCocktailIngredient(.syrups(.limeCordial), value: 1, unit: .teaspoon, prep: PrepBible.limeCordial),
                     OldCocktailIngredient(.liqueurs(.orangeCuracao), value: 0.5),
                     OldCocktailIngredient(.gins(.ginAny), value: 2)]

var peguClubTags = Tags(profiles: [.citrusy, .tart, .light, .restorative],
                        styles: [.daisy, .shaken, .sour])

