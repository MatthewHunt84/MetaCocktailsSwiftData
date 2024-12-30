//
//  TemperanceGrapefruitCollins.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation


var temperanceGrapefruitCollins  = Cocktail(cocktailName: "Temperance Grapefruit Collins",
                                            glasswareType: .collins,
                                            garnish: [.grapefruitWedge],
                                            ice: .columnIce,
                                            author: sashaPetraske,
                                            spec: temperanceGrapefruitCollinsSpec,
                                            buildOrder: temperanceGrapefruitCollinsBuild,
                                            tags: temperanceGrapefruitCollinsTags,
                                            variation: .tomCollins,
                                            collection: .milkAndHoney)

var temperanceGrapefruitCollinsSpec  = [OldCocktailIngredient(.juices(.lime), value: 1),
                                        OldCocktailIngredient(.juices(.grapefruit), value: 2),
                                        OldCocktailIngredient(.syrups(.simple), value: 0.5, prep: PrepBible.simpleSyrupPrep),
                                        OldCocktailIngredient(.soda(.sodaWater) , value: 1)]



var temperanceGrapefruitCollinsTags   = Tags(profiles: [.citrusy, .effervescent, .light, .fruity],
                                             styles: [.collins, .shaken, .nonAlcoholic])

