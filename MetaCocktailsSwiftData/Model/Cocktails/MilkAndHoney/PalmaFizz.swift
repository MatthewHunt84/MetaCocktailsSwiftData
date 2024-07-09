//
//  PalmaFizz.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var palmaFizz  = Cocktail(cocktailName: "Palma Fizz",
                          glasswareType: .collins,
                          garnish: nil,
                          ice: .koldDraft,
                          author: Author(person: AuthorNames.sashaPetraske.rawValue,
                                         place: AuthorPlaces.milkAndHoney.rawValue,
                                         year: "Early 2000s"),
                          spec: palmaFizzSpec,
                          buildOrder: palmaFizzBuild,
                          tags: palmaFizzTags,
                          variation: nil,
                          collection: .milkAndHoney)

var palmaFizzSpec  = [OldCocktailIngredient(.juices(.lime), value: 0.5),
                      OldCocktailIngredient(.otherNonAlc(.roseWater), value: 3, unit: .drops),
                      OldCocktailIngredient(.vodkas(.vodkaAny), value: 2),
                      OldCocktailIngredient(.soda(.gingerBeer) , value: 5)]

var palmaFizzBuild  = Build(instructions: [Instruction(step: 1, method: "Squeeze ½ oz (15 ml) of lime juice into a Collins glass (or a Moscow Mule mug) and drop in the empty half lime shell."),
                                           Instruction(step: 2, method: "Add 2 or 3 ice cubes, pour in the vodka, and fill with the ginger beer."),
                                           Instruction(step: 3, method: "Add a few drops of rosewater or spray the rosewater over the cocktail.")])

var palmaFizzTags   = Tags(profiles: [.citrusy, .effervescent, .light, .sharp],
                           styles: [.collins, .shaken])

