//
//  TheStark.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var theStark = Cocktail(cocktailName: "The Stark",
                        glasswareType: .doubleOld,
                        garnish: nil,
                        ice: .crackedIce,
                        author:Author(person: AuthorNames.sashaPetraske.rawValue,
                                      place: AuthorPlaces.milkAndHoney.rawValue,
                                      year: "Early 2000s"),
                        spec: theStarkSpec,
                        buildOrder: nil,
                        tags: theStarkTags,
                        variation: nil ,
                        collection: .milkAndHoney,
                        titleCocktail: false)

var theStarkSpec = [OldCocktailIngredient(.bitters(.angosturaBitters), value: 4, unit: .dashes),
                    OldCocktailIngredient(.liqueurs(.yellowChartreuse), value: 0.75),
                    OldCocktailIngredient(.juices(.lemon), value: 0.5, unit: .fluidOunces),
                    OldCocktailIngredient(.syrups(.honeySyrup), value: 0.5, prep: PrepBible.honeySyrup),
                    OldCocktailIngredient(.whiskies(.bourbonAny), value: 1.5)]

var theStarkTags = Tags(profiles: [.citrusy, .refreshing, .herbal, .complex],
                        styles: [.sour, .shaken])


let theStarkBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except the bitters, into a tin and shake with ice."),
                                         Instruction(step: 2, method: "Strain into a double old fashioned glass and then fill the glass with cracked ice."),
                                         Instruction(step: 3, method: "Float the bitters on top.")])
