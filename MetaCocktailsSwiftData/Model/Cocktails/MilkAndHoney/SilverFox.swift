//
//  SilverFox.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var silverFox  = Cocktail(cocktailName: "Silver Fox",
                          glasswareType: .fizzGlass,
                          garnish: [.maraschinoCherry, .halfOrangeWheel],
                          ice: nil,
                          author: Author(person: AuthorNames.richardBoccato.rawValue,
                                         place: AuthorPlaces.milkAndHoney.rawValue,
                                         year: "Early 2000s"),
                          spec: silverFoxSpec,
                          buildOrder: silverFoxBuild,
                          tags: silverFoxTags,
                          variation: nil,
                          collection: .milkAndHoney)

var silverFoxSpec  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                      CocktailIngredient(.syrups(.orgeat), value: 0.5, prep: PrepBible.orgeat),
                      CocktailIngredient(.otherNonAlc(.eggWhites), value: 1, unit: .whole),
                      CocktailIngredient(.gins(.ginAny), value: 1.5),
                      CocktailIngredient(.liqueurs(.amaretto), value: 0.5, unit: .fluidOuncesFloated),
                      CocktailIngredient(.soda(.sodaWater) , value: 1.5)]

var silverFoxBuild  = Build(instructions: [Instruction(step: 1, method: "Combine the egg white, orgeat syrup, lemon juice, and gin in a cocktail shaker and shake to emulsify the mixture."),
                                           Instruction(step: 2, method: "Add one large ice cube and shake vigorously until the drink is sufficiently chilled."),
                                           Instruction(step: 3, method: "Strain into a chilled 9-oz (270 ml) highball glass."),
                                           Instruction(step: 4, method: "Top off with soda and float the amaretto or Faretti on top. Serve with a straw.")])

var silverFoxTags   = Tags(profiles: [.citrusy, .nutty, .light, .silky],
                           styles: [.fizz, .shaken])

