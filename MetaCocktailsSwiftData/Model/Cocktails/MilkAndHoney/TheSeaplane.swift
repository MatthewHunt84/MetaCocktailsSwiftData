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

var theSeaPlaneSpec  = [CocktailIngredient(.juices(.lemon), value: 0.5),
                        CocktailIngredient(.syrups(.simple), value: 0.5),
                        CocktailIngredient(.gins(.ginAny), value: 1),
                        CocktailIngredient(.otherAlcohol(.absinthe), value: 5, unit: .sprays),
                        CocktailIngredient(.bitters(.orangeBitters), value: 2, unit: .dashes),
                        CocktailIngredient(.wines(.champagne) , value: 2)]

var theSeaPlaneBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the Champagne and absinthe, into a tin and shake with ice"),
                                             Instruction(step: 2, method: "Strain into an absinthe rinsed flute and top with Champagne"),
                                             Instruction(step: 3, method: "Give a gentle stir")])

var theSeaPlaneTags   = Tags(profiles: [.citrusy, .effervescent, .bright],
                             styles: [ .shaken, .fizz])

