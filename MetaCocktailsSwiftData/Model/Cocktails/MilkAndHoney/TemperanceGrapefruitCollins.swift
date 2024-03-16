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

var temperanceGrapefruitCollinsSpec  = [CocktailIngredient(.juices(.lime), value: 1),
                                        CocktailIngredient(.juices(.grapefruit), value: 2),
                                        CocktailIngredient(.syrups(.simple), value: 0.5),
                                        CocktailIngredient(.soda(.sodaWater) , value: 1)]

var temperanceGrapefruitCollinsBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the soda, into a tin and shake with ice"),
                                                             Instruction(step: 2, method: "Strain over column ice and top with soda"),
                                                             Instruction(step: 3, method: "Give a gentle stir and then garnish with a grapefruit wedge.")])

var temperanceGrapefruitCollinsTags   = Tags(profiles: [.citrusy, .effervescent, .light, .fruity],
                                             styles: [.collins, .shaken, .nonAlcoholic])

