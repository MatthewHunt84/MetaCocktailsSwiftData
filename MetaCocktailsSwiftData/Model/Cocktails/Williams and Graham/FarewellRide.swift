//
//  FarewellRide.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var farewellRide = Cocktail(cocktailName: "Farewell Ride",
                               glasswareType: .coupe,
                               garnish: nil,
                               ice: nil,
                               author: Author(person: AuthorPlaces.williamsAndGraham.rawValue),
                               spec: farewellRideSpec,
                               tags: farewellRideTags)

var farewellRideSpec  = [CocktailIngredient(.bitters(.blackstrapBitters), value: 2, unit: .dashes),
                            CocktailIngredient(.amari(.amaroNonino), value: 0.5),
                            CocktailIngredient(.amari(.becherovka), value: 0.75),
                            CocktailIngredient(.whiskies(.knob120), value: 2)]

var farewellRideTags = Tags(profiles: [.dry, .bittersweet, .punchy, .spiritForward],
                               styles: [.manhattan, .stirred])
