//
//  TheSeaplane.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/12/24.
//

import Foundation

var theSeaPlane  = Cocktail(cocktailName: "The Seaplane",
                            glasswareType: .flute,
                            garnish: nil,
                            ice: nil ,
                            author: Author( person: AuthorNames.josephSchwartz.rawValue,
                                            place: AuthorPlaces.milkAndHoney.rawValue,
                                            year: "Early 2000s"),
                            spec: theSeaPlaneSpec,
                            buildOrder: theSeaPlaneBuild,
                            tags: theSeaPlaneTags,
                            variation: nil,
                            collection: .milkAndHoney)

var theSeaPlaneSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.5),
                        OldCocktailIngredient(.syrups(.simple), value: 0.5, prep: PrepBible.simpleSyrupPrep),
                        OldCocktailIngredient(.gins(.ginAny), value: 1),
                        OldCocktailIngredient(.otherAlcohol(.absinthe), value: 5, unit: .sprays),
                        OldCocktailIngredient(.bitters(.orangeBitters), value: 2, unit: .dashes),
                        OldCocktailIngredient(.wines(.champagne) , value: 2)]



var theSeaPlaneTags   = Tags(profiles: [.citrusy, .effervescent, .light],
                             styles: [ .shaken, .fizz])

