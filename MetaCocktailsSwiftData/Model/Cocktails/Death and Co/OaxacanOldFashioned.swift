//
//  OaxacanOldFashioned.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var oaxacaOldFashioned = Cocktail(cocktailName: "Oaxaca Old Fashioned",
                                  glasswareType: .doubleOld,
                                  garnish: [.flamedOrange],
                                  ice: .bigRock,
                                  author:Author(person: AuthorNames.philWard.rawValue, place: AuthorPlaces.deathAndCo.rawValue, year: "2007"),
                                  spec: oaxacaOldFashionedSpec,
                                  tags: oaxacaOldFashionedTags,
                                  variation: .oaxacaOldFashioned,
                                  collection: .deathAndCo,
                                  titleCocktail: true)

var oaxacaOldFashionedSpec  = [OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                               OldCocktailIngredient(.syrups(.agaveNectar), value: 1, unit: .teaspoon),
                               OldCocktailIngredient(.agaves(.mezcalDelMagueySanLuis), value: 0.5),
                               OldCocktailIngredient(.agaves(.elTesoroRepo), value: 1.5)]

var oaxacaOldFashionedTags = Tags(profiles: [.spiritForward, .punchy, .complex],
                                  styles: [.oldFashioned, .stirred])

