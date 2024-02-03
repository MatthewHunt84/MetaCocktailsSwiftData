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
                                   author: justWnG,
                                   spec: whatsYourFavoriteSpec,
                                   buildOrder: nil,
                                   tags: whatsYourFavoriteTags)

var whatsYourFavoriteSpec = [CocktailIngredient(.bitters(.peychauds), value: 2, unit: .dashes),
                             CocktailIngredient(.fortifiedWines(.amontillado), value: 0.25),
                             CocktailIngredient(.fortifiedWines(.lustauPX), value: 0.25),
                             CocktailIngredient(.amari(.cardamaro), value: 0.5),
                             CocktailIngredient(.rums(.appleton12), value: 2)]

var whatsYourFavoriteTags = Tags(profiles: [.fruity, .spiritForward, .elegant],
                                 styles: [.manhattan, .stirred])
