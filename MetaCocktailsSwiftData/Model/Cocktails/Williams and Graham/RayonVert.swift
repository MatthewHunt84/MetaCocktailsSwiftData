//
//  RayonVert.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation

var reyonVert = Cocktail(cocktailName: "Rayon Vert",
                         imageAsset: nil,
                         glasswareType: .doubleOld,
                         garnish: [.basilSprig],
                         ice: .bigRock,
                         author:Author(person: AuthorNames.jamesMenkal.rawValue,
                                       place: AuthorPlaces.williamsAndGraham.rawValue,
                                       year: "2018"),
                         spec: reyonVertSpec,
                         buildOrder: reyonVertBuild,
                         tags: reyonVertTags,
                         collection: .williamsAndGraham)

let reyonVertSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.herbs(.basil), value: 7, unit: .nitroMuddled),
                                           OldCocktailIngredient(.juices(.lime), value: 0.5),
                                           OldCocktailIngredient(.syrups(.cucumberSyrup), value: 0.5, prep: PrepBible.cucumberSyrup),
                                           OldCocktailIngredient(.gins(.juinipero), value: 2),
                                           OldCocktailIngredient(.otherAlcohol(.absinthe), value: 5, unit: .sprays)]
                                        

let reyonVertTags = Tags(profiles: [.herbal, .refreshing, .light, .restorative],
                      styles: [.sour, .shaken])

let reyonVertBuild =  Build(instructions: [Instruction(step: 1, method: "Add the basil to a tin and nitro muddle (muddle with liquid nitrogen.)"),
                                           Instruction(step: 2, method: "add the rest of the ingredients excluding the absinthe and shake."),
                                           Instruction(step: 3, method: "Rinse the glass with absinthe (4-5 sprays with a atomizer.)"),
                                           Instruction(step: 4, method: "Double strain over a large rock."),
                                           Instruction(step: 4, method: "Garnish with a basil sprig.")])

