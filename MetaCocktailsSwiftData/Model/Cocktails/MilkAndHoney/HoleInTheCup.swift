//
//  HoleInTheCup.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/12/24.
//

import Foundation


var holeInTheCup = Cocktail(cocktailName: "Hole in the Cup",
                            glasswareType: .coupe,
                            garnish: [.cucumberSlices],
                            ice: nil ,
                            author:Author(person: AuthorNames.laurenMcLaughlin.rawValue ,
                                          place: AuthorPlaces.milkAndHoney.rawValue ,
                                          year: "Early 2000s"),
                            spec: holeInTheCupSpec,
                            buildOrder: holeInTheCupBuild,
                            tags: holeInTheCupTags,
                            collection: .milkAndHoney)

var holeInTheCupSpec     =  [OldCocktailIngredient(.fruit(.cucumberSlices), value: 2, unit: .gentlyMuddled),
                             OldCocktailIngredient(.juices(.lime), value: 0.5),
                             OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                             OldCocktailIngredient(.juices(.pineappleJuice), value: 1),
                             OldCocktailIngredient(.otherAlcohol(.absinthe), value: 0.25),
                             OldCocktailIngredient(.agaves(.tequilaBlanco), value: 1.5)]

var holeInTheCupTags     = Tags(profiles: [.savory, .refreshing, .citrusy, .complex, .spicy, .restorative],
                                styles: [.sour, .shaken])


