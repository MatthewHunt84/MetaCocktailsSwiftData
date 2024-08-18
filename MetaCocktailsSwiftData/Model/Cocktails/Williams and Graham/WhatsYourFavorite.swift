//
//  WhatsYourFavorite.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var whatsYourFavorite  =  Cocktail(cocktailName: "What's Your Favorite",
                                   glasswareType: .martini,
                                   garnish: [.lemonPeel],
                                   ice: nil,
                                   author: Author(person: AuthorNames.chadMG.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue),
                                   spec: whatsYourFavoriteSpec,
                                   buildOrder: nil,
                                   tags: whatsYourFavoriteTags,
                                   collection: .williamsAndGraham)

var whatsYourFavoriteSpec = [OldCocktailIngredient(.bitters(.peychauds), value: 2, unit: .dashes),
                             OldCocktailIngredient(.fortifiedWines(.amontillado), value: 0.25),
                             OldCocktailIngredient(.fortifiedWines(.lustauPX), value: 0.25),
                             OldCocktailIngredient(.amari(.cardamaro), value: 0.5),
                             OldCocktailIngredient(.rums(.appleton12), value: 2)]

var whatsYourFavoriteTags = Tags(flavors: [.lemon],
                                 profiles: [.fruity, .spiritForward],
                                 styles: [.manhattan, .stirred])
