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
                          buildOrder: fakerFaceBuild,
                          tags: fakerFaceTags,
                          variation: nil,
                          collection: .milkAndHoney)

var fakerFaceSpec  = [OldCocktailIngredient(.juices(.lime), value: 0.75),
                      OldCocktailIngredient(.syrups(.grenadine), value: 0.75, prep: PrepBible.grenadine),
                      OldCocktailIngredient(.juices(.orange), value: 1),
                      OldCocktailIngredient(.soda(.sodaWater) , value: 2)]

var fakerFaceTags   = Tags(profiles: [.citrusy, .fruity, .effervescent, .light],
                           styles: [.nonAlcoholic, .shaken, .sour])


