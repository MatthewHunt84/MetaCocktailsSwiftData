//
//  RichGirl.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation


var richGirl  =  Cocktail(cocktailName: "Rich Girl",
                          glasswareType: .nickAndNora,
                          garnish: [.lemonPeel],
                          ice: nil,
                          author: Author(place: AuthorPlaces.williamsAndGraham.rawValue),
                          spec: richGirlSpec,
                          buildOrder: nil,
                          tags: richGirlTags)

var richGirlSpec = [CocktailIngredient(.seasoning(.saline), value: 2, unit: .drops),
                    CocktailIngredient(.bitters(.bolivarBitters), value: 2, unit: .dashes),
                    CocktailIngredient(.liqueurs(.nuxAlpina), value: 0.5),
                    CocktailIngredient(.fortifiedWines(.capaletti), value: 1),
                    CocktailIngredient(.rums(.banks5), value: 2)]

var richGirlTags = Tags(profiles: [.rich, .bittersweet, .spiritForward, .complex],
                        styles: [.martini, .stirred])
