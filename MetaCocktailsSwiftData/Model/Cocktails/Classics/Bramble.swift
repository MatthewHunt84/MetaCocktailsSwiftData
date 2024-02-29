//
//  Bramble.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var bramble = Cocktail(cocktailName: "Bramble",
                       imageAsset: nil,
                       glasswareType: .doubleOld,
                       garnish: [.lemonWheel, .blackberry],
                       ice: .pebbleIce,
                       author:Author(person: AuthorNames.dickBradsell.rawValue,
                                     place: AuthorPlaces.fredsClubLondon.rawValue,
                                     year: "1989") ,
                       spec: brambleSpec,
                       buildOrder: brambleBuild,
                       tags: brambleTags,
                       variation: .bramble,
                       collection: .originals)

let brambleSpec: [CocktailIngredient] = [CocktailIngredient(.juices(.lemon), value: 1),
                                         CocktailIngredient(.syrups(.richSimple), value: 0.5, prep: PrepBible.richSimple),
                                         CocktailIngredient(.liqueurs(.cremeDeMure), value: 1, unit: .float),
                                         CocktailIngredient(.gins(.ginLondonDry), value: 2)]

let brambleTags = Tags(flavors: [.lemon],
                       profiles: [.fruity, .floral, .light],
                       styles: [.built, .shaken])

let brambleBuild =  Build(instructions: [Instruction(step: 1, method: "This is typically a built cocktail."),
                                          Instruction(step: 2, method: "If following tradition, add crushed ice to a double old fashioned glass and add the ingredients to that."),
                                          Instruction(step: 3, method: "Then, drizzle the creme de mure over the top."),
                                          Instruction(step: 4, method: "Garnish with blackberry and lemon wheel."),
                                          Instruction(step: 5, method: "NOTE: This cocktail is significantly improved with fresh muddled bramble fruit(i.e. blackberries and raspberries). In this case, shake the cocktail, double strain the fruit and still leave the creme de mure to float.")])

