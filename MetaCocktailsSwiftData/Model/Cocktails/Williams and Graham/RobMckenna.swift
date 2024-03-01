//
//  RobMckenna.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/3/24.
//

import Foundation


var robMcKenna = Cocktail(cocktailName: "Rob McKenna",
                          imageAsset: nil,
                          glasswareType: .doubleOld,
                          garnish: nil,
                          ice: .bigRock,
                          author: Author(person: "Justin Jenkins", place: AuthorPlaces.williamsAndGraham.rawValue, year: "Winter, 2021"),
                          spec: robMcKennaSpec,
                          tags: robMcKennaTags,
                          collection: .williamsAndGraham)

let robMcKennaSpec: [CocktailIngredient] = [CocktailIngredient(.seasoning(.saline), value: 15, unit: .drops),
                                            CocktailIngredient(.bitters(.orangeBitters), value: 2, unit: .dashes),
                                            CocktailIngredient(.syrups(.cinnamonSyrup), value: 0.23),
                                            CocktailIngredient(.amari(.fernetBranca), value: 0.5),
                                            CocktailIngredient(.liqueurs(.borghetti), value: 0.5),
                                            CocktailIngredient(.whiskies(.portCharlotte), value: 1)]


let robMcKennaTags = Tags(profiles: [.rich, .complex, .punchy, .herbal, .spiritForward],
                          styles: [.oldFashioned, .stirred])

