////
////  DivisionBell.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////

import SwiftUI

var divisionBell = Cocktail(cocktailName: "Division Bell",
                            glasswareType: .stemmedGlassware,
                            garnish: [.grapefruitExpression],
                            ice: nil,
                            author:Author(person: AuthorNames.philWard.rawValue,
                                          place: AuthorPlaces.deathAndCo.rawValue),
                            spec: divisionBellSpec,
                            tags: divisionBellTags,
                            collection: .deathAndCo)

var divisionBellSpec  = [OldCocktailIngredient(.juices(.lime), value: 0.75),
                         OldCocktailIngredient(.agaves(.mezcalDelMagueyVida), value: 1),
                         OldCocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.5),
                         OldCocktailIngredient(.amari(.aperol), value: 0.75)]

var divisionBellTags = Tags(profiles: [.light, .dry, .fruity],
                            styles: [.sour, .shaken],
                            booze: [Booze(.agaves(.mezcalAny))])
                           
