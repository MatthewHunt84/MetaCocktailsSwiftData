//
//  FakerFace.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var fakerFace  = Cocktail(cocktailName: "Faker Face",
                          glasswareType: .coupe,
                          garnish: [.blackberry],
                          ice: nil,
                          author: sashaPetraske,
                          spec: fakerFaceSpec,
                          buildOrder: nil,
                          tags: fakerFaceTags,
                          variation: nil,
                          collection: .milkAndHoney)

var fakerFaceSpec  = [CocktailIngredient(.juices(.lime), value: 0.75),
                      CocktailIngredient(.syrups(.grenadine), value: 0.75),
                      CocktailIngredient(.juices(.orange), value: 1),
                      CocktailIngredient(.soda(.sodaWater) , value: 2, unit: .fluidOuncesFloated)]

var fakerFaceTags   = Tags(profiles: [.citrusy, .fruity, .effervescent, .light],
                           styles: [.nonAlcoholic, .shaken, .sour])

