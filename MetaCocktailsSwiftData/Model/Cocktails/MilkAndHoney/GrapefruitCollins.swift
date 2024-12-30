//
//  GrapefruitCollins.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var grapefruitCollins  = Cocktail(cocktailName: "Grapefruit Collins",
                                  glasswareType: .collins,
                                  garnish: [.grapefruitPeel],
                                  ice: .columnIce,
                                  author: sashaPetraske,
                                  spec: grapefruitCollinsSpec,
                                  buildOrder: grapefruitCollinsBuild,
                                  tags: grapefruitCollinsTags,
                                  variation: .tomCollins,
                                  collection: .milkAndHoney)

var grapefruitCollinsSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                              OldCocktailIngredient(.juices(.grapefruit), value: 1),
                              OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                              OldCocktailIngredient(.gins(.ginAny), value: 2),
                              OldCocktailIngredient(.soda(.sodaWater) , value: 0.5)]



var grapefruitCollinsTags   = Tags(flavors: [.lemon],
                                   profiles: [.citrusy, .effervescent, .light, .fruity],
                                   styles: [.collins, .shaken])

