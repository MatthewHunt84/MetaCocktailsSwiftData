//
//  RobMckenna.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/3/24.
//

import Foundation


var robMcKenna = Cocktail(cocktailName: "Rob McKenna",
                          glasswareType: .doubleOld,
                          ice: .bigRock,
                          author: Author(person: "Justin Jenkins", place: AuthorPlaces.williamsAndGraham.rawValue, year: "Winter, 2021"),
                          spec: robMcKennaSpec,
                          tags: robMcKennaTags,
                          collection: .williamsAndGraham)

let robMcKennaSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.seasoning(.saline), value: 15, unit: .drops, prep: PrepBible.fiveToOneSaline),
                                            OldCocktailIngredient(.bitters(.orangeBitters), value: 2, unit: .dashes),
                                            OldCocktailIngredient(.syrups(.cinnamonSyrup), value: 0.23, prep: PrepBible.cinnamonSyrup),
                                            OldCocktailIngredient(.amari(.fernetBranca), value: 0.5),
                                            OldCocktailIngredient(.liqueurs(.borghetti), value: 0.5),
                                            OldCocktailIngredient(.whiskies(.portCharlotte), value: 1)]


let robMcKennaTags = Tags(profiles: [.rich, .complex, .punchy, .herbal, .spiritForward],
                          styles: [.oldFashioned, .stirred])

