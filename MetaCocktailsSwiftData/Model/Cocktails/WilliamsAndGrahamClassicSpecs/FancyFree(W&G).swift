//
//  FancyFree(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var fancyFreeWnG = Cocktail(cocktailName: "Fancy Free (Williams & Graham Spec)",
                            glasswareType: .doubleOld,
                            garnish: [.orangePeel],
                            ice: .bigRock,
                            author: Author(person: AuthorNames.crosbyGaige.rawValue,
                                           place: AuthorPlaces.crosbyGaigeCocktailGuide.rawValue,
                                           year: "1940"),
                            spec: fancyFreeWnGSpec,
                            tags: fancyFreeTags)

var fancyFreeWnGSpec     =  [CocktailIngredient(.bitters(.orangeBitters), value: 4, unit: .dash),
                             CocktailIngredient(.bitters(.angosturaBitters), value: 3, unit: .dash),
                             CocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.5),
                             CocktailIngredient(.whiskies(.fourRosesYellowLabel), value: 2)]
