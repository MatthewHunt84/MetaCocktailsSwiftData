//
//  BrandyCrusta.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var brandyCrusta = Cocktail(cocktailName: "Brandy Crusta",
                            glasswareType: .nickAndNora,
                            author: jerryThomas,
                            spec: brandyCrustaSpec,
                            buildOrder: brandyCrustaBuild,
                            tags: brandyCrustaTags,
                            variation: .brandyCrusta,
                            collection: .originals,
                            titleCocktail: true)

var brandyCrustaSpec    = [OldCocktailIngredient(.juices(.lemon), value: 1, unit: .dashes),
                           OldCocktailIngredient(.liqueurs(.orangeCuracao), value: 2, unit: .dashes),
                           OldCocktailIngredient(.syrups(.gommeSyrup), value: 4, unit: .dashes, prep: PrepBible.gommeSyrup),
                           OldCocktailIngredient(.bitters(.angosturaBitters), value:1, unit: .dashes),
                           OldCocktailIngredient(.brandies(.brandyAny), value:2)]

var brandyCrustaTags     = Tags(profiles: [.spiritForward, .rich, .fruity],
                                styles: [.sour, .stirred])



