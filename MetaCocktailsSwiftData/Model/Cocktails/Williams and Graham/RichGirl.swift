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
                          author: Author(person: "Justin Jenkins", place: AuthorPlaces.williamsAndGraham.rawValue, year: "2019"),
                          spec: richGirlSpec,
                          buildOrder: nil,
                          tags: richGirlTags,
                          collection: .williamsAndGraham)

var richGirlSpec = [OldCocktailIngredient(.seasoning(.saline), value: 2, unit: .drops),
                    OldCocktailIngredient(.bitters(.bolivarBitters), value: 2, unit: .dashes),
                    OldCocktailIngredient(.liqueurs(.nuxAlpina), value: 0.5),
                    OldCocktailIngredient(.fortifiedWines(.capaletti), value: 1),
                    OldCocktailIngredient(.rums(.banks5), value: 2)]

var richGirlTags = Tags(profiles: [.rich, .bittersweet, .spiritForward, .complex],
                        styles: [.martini, .stirred])
