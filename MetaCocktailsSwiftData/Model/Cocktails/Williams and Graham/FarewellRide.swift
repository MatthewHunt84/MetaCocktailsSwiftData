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
                               author: Author(person: AuthorNames.chadLarson.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue),
                               spec: farewellRideSpec,
                               tags: farewellRideTags,
                            collection: .williamsAndGraham)

var farewellRideSpec  = [OldCocktailIngredient(.bitters(.blackstrapBitters), value: 2, unit: .dashes),
                            OldCocktailIngredient(.amari(.amaroNonino), value: 0.5),
                            OldCocktailIngredient(.amari(.becherovka), value: 0.75),
                            OldCocktailIngredient(.whiskies(.knob120), value: 2)]

var farewellRideTags = Tags(profiles: [.dry, .bittersweet, .punchy, .spiritForward],
                               styles: [.manhattan, .stirred])
