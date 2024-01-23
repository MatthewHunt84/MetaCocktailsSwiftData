////
////  RamosGinFizz.swift
////  MetaCocktails
////
////  Created by Matt Hunt on 9/1/23.
////

import SwiftUI

var ramosGinFizz = Cocktail(cocktailName: "Ramos Gin Fizz", 
                            imageAsset: nil,
                            glasswareType: .collins,
                            garnish: [.orangePeel],
                            ice: .koldDraft,
                            author:Author(person: "Henry C. Ramos"),
                            spec: ramosGinFizzSpec,
                            buildOrder: ramosGinFizzBuild,
                            tags: ramosTags)

let ramosGinFizzSpec: [CocktailIngredient] = [CocktailIngredient(.gins(.ginAny), value: 2.0),
                                              CocktailIngredient(.juices(.lime), value: 0.5),
                                              CocktailIngredient(.juices(.lemon), value: 0.5),
                                              CocktailIngredient(.syrups(.simple), value: 1.0),
                                              CocktailIngredient(.otherNonAlc(.cream), value: 1.0),
                                              CocktailIngredient(.otherNonAlc(.eggWhites), value: 1.25),
                                              CocktailIngredient(.soda(.sodaWater), value: 2.0),
                                              CocktailIngredient(.otherNonAlc(.orangeFlowerWater), value: 3, unit: .drops)]

var ramosTags = Tags(flavors: [.lemon, .lime],
                     profiles: [.floral, .citrusy, .creamy],
                     textures: [.creamy],
                     styles: [.sour, .shaken])

var ramosGinFizzBuild: Build = Build(instructions: [Instruction(step: 1, method: "Chill your 14oz. collins glass ahead of time"),
                                                    Instruction(step: 2, method: "Add all of the ingredients, except for the soda, into a tin along with two Kold Draft cubs, or their equivalent weight in alternative ice (roughly 16g)."),
                                                    Instruction(step: 3, method: "Shake vigorously until the Ice cubes completely dissolve."),
                                                    Instruction(step: 4, method: "Add the soda to the chilled glass."),
                                                    Instruction(step: 5, method: "Give the tin a couple more shakes to re-emulsify then pop the tin and strain the cocktail over the soda as quickly as possible (the forceful motion of the cocktail getting added to the soda creates the initial reaction that you need to form the head). Fill until the head touches the top of the glass. There should be 2-4oz. of liquid left in the tin. Put it aside for step 7."),
                                                    Instruction(step: 6, method: "Be patient. Let the cocktail sit for a minute or two so that the head can properly separate from the rest of the cocktail. After you see a clear separation, place the teardrop end of the bar spoon down the center of the cocktail. This will serve as a guide for the rest of the cocktail to be added.\n\n7. Pour the rest of the cocktail from the tin down the guide. Be careful so that you don't disturb the head of the cocktail. if you need more liquid to push the head further up above the rim, add more soda to the tin and repeat this step until you have your desired height."),
                                                    Instruction(step: 7, method: "Pour the rest of the cocktail from the tin down the guide. Be careful so that you don't disturb the head of the cocktail. if you need more liquid to push the head further up above the rim, add more soda to the tin and repeat this step until you have your desired height."),
                                                    Instruction(step: 8, method: "Add three drops of orange flower water to the top of the cocktail. Garnish with orange zest.")])

