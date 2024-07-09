//
//  SiGuey.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/29/24.
//

import Foundation

var siGuey = Cocktail(cocktailName: "Si-Guey",
                      glasswareType: .doubleOld,
                      ice: .bigRock,
                      author:Author(person: AuthorNames.michaelMadrusan.rawValue ,  place: AuthorPlaces.milkAndHoney.rawValue , year: "Early 2000s"),
                      spec: siGueySpec,
                      buildOrder: siGueyBuild,
                      tags: siGueyTags,
                      collection: .milkAndHoney)

var siGueySpec     =  [OldCocktailIngredient(.bitters(.orangeBitters), value: 3, unit: .dashes),
                       OldCocktailIngredient(.liqueurs(.dryCuracao), value: 0.25),
                       OldCocktailIngredient(.agaves(.tequilaReposado), value: 2),
                       OldCocktailIngredient(.whiskies(.scotchIsla), value: 0.25)]

var siGueyTags     = Tags(profiles: [.spiritForward, .bittersweet, .fruity, .smokey, .complex],
                          styles: [.oldFashioned, .stirred])

var siGueyBuild = Build(instructions: [Instruction(step: 1, method: "Build the drink over a large cube in a double Old Fashioned glass, starting with the bitters and ending with tequila."),
                                       Instruction(step: 2, method: "Stir."),
                                       Instruction(step: 3, method: "Float the whisky.")])
